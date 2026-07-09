import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../../domain/entities/user_account_entity.dart';
import '../../../../core/database/app_database.dart';

class UserAccountModel extends UserAccountEntity {
  const UserAccountModel({
    required super.uid,
    required super.email,
    // super.hasProfile,
  });

  // ── FROM FIREBASE ──────────────────────────────────────────
  // Called in remote datasource after Firebase sign in
  factory UserAccountModel.fromFirebase(fb.User firebaseUser) {
    return UserAccountModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
    );
  }

  // Called when reading a document back from Firestore
  // json is whatever DocumentSnapshot.data() returns — a raw Map
  factory UserAccountModel.fromFirestore(Map<String, dynamic> json) {
    return UserAccountModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      // hasProfile: json['hasProfile'] as bool
    );
  }

  // ── FROM DRIFT ROW ─────────────────────────────────────────
  // Called in local datasource when reading from SQLite
  factory UserAccountModel.fromDrift(UserAccountTableData row) {
    return UserAccountModel(uid: row.id, email: row.email, /*hasProfile: row.hasProfile*/);
  }

  // ── TO DRIFT COMPANION ─────────────────────────────────────
  // Called in local datasource when writing to SQLite
  UserAccountTableData toDriftCompanion() {
    return UserAccountTableData(
      id: uid,
      email: email,
      lastSyncedAt: DateTime.now(),
      // hasProfile: hasProfile ?? false,
    );
  }

  // ── TO ENTITY ──────────────────────────────────────────────
  // Explicit upcast — useful when a function expects UserEntity
  UserAccountEntity toEntity() {
    return UserAccountEntity(uid: uid, email: email,);
  }
}
