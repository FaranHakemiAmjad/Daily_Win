// ════════════════════════════════════════════════════════════════
// FILE: lib/features/auth/data/datasources/firestore/auth_firestore_datasource.dart
// ════════════════════════════════════════════════════════════════

// Syncs IDENTITY data (uid, email, displayName, photoUrl) to Firestore.
// This is NOT the profile feature — it knows nothing about
// streakCount, totalWins, bio, etc.
// It only mirrors what Firebase Auth already knows, into Firestore,
// so other parts of the app (or other users, e.g. in a feed) can
// read basic identity info without calling Firebase Auth directly
// (Firebase Auth only exposes the CURRENTLY signed in user — it can't
// fetch "what is user X's displayName" for some other uid).

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_win/features/auth/data/models/user_account_model.dart';
import '../../../../../core/error/exceptions.dart';

abstract class AuthFirestoreDataSource {
  // Called once, right after sign up
  Future<void> createUserDocument(UserAccountModel user);

  // Called if displayName/photoUrl ever changes later
  Future<void> updateUserDocument(UserAccountModel user);

  // Useful for reading another user's identity (e.g. for the feed)
  Future<UserAccountModel?> getUserDocument(String uid);
}

class AuthFirestoreDataSourceImpl implements AuthFirestoreDataSource {
  final FirebaseFirestore firestore;
  AuthFirestoreDataSourceImpl({required this.firestore});

  // Helper — keeps the collection name in one place
  // if you ever rename the collection, you only change it here
  DocumentReference<Map<String, dynamic>> _doc(String uid) {
    return firestore.collection('users').doc(uid);
  }

  @override
  Future<void> createUserDocument(UserAccountModel user) async {
    try {
      // set() creates the doc if it doesn't exist, or overwrites it if it does
      // we use the uid Firebase Auth gave us as the document ID —
      // this is the link between Firebase Auth and this Firestore doc
      await _doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        // 'hasProfile': user.hasProfile ?? false,
      });
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }

  @override
  Future<void> updateUserDocument(UserAccountModel user) async {
    try {
      // merge: true means only these fields are touched
      // any other fields on the document (added later by other features)
      // remain untouched
      await _doc(user.uid).set({
        // 'hasProfile': user.hasProfile,
      }, SetOptions(merge: true));
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }

  @override
  Future<UserAccountModel?> getUserDocument(String uid) async {
    try {
      final snapshot = await _doc(uid).get();
      if (!snapshot.exists) return null;

      final data = snapshot.data()!;
      return UserAccountModel(
        uid: data['uid'] as String,
        email: data['email'] as String,
        // hasProfile: data['hasProfile'] as bool,
      );
    } catch (e) {
      throw AuthException(message: e.toString());
    }
  }
}