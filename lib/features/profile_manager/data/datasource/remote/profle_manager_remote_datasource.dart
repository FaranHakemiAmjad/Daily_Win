
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_win/core/error/exceptions.dart';
import 'package:daily_win/features/profile_manager/data/models/user_profile_model.dart';

abstract class ProfileManagerRemoteDatasource {

  // Called once, right after sign up
  Future<void> createUserDocument(UserProfileModel profile);

  // Called if displayName/photoUrl ever changes later
  Future<void> updateUserDocument(UserProfileModel profile);

  // Useful for reading another user's identity (e.g. for the feed)
  Future<UserProfileModel?> getUserDocument(String uid);

}

class ProfileManagerRemoteDatasourceImpl implements ProfileManagerRemoteDatasource{
  final FirebaseFirestore firestore;
  ProfileManagerRemoteDatasourceImpl({required this.firestore});

  DocumentReference<Map<String, dynamic>> _doc(String uid) {
    return firestore.collection('users').doc(uid);
  }

  @override
  Future<void> createUserDocument(UserProfileModel profile) async {
    try {
      await _doc(profile.id).set(
        profile.toFirestore(),
        SetOptions(merge: true));
    } catch (e) {
      throw ProfileException(message: e.toString());
    }
  }

  @override
  Future<UserProfileModel?> getUserDocument(String uid) async{
    try {
      final snapshot = await _doc(uid).get();
      if (!snapshot.exists) return null;

      final data = snapshot.data()!;
      return UserProfileModel.fromFirestore(data);
    } catch (e) {
      throw ProfileException(message: e.toString());
    }
  }

  @override
  Future<void> updateUserDocument(UserProfileModel user) {
    // TODO: implement updateUserDocument
    throw UnimplementedError();
  }
}