import 'dart:io';

import 'package:daily_win/core/database/app_database.dart';
import 'package:daily_win/features/profile_manager/domain/entities/user_profile_entity.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.id,
    required super.username,
    required super.gender,
    required super.dateOfBirth,
    super.biography,
    super.profileImage,
    super.profileImagePath,
  });

  factory UserProfileModel.fromEntity(UserProfileEntity entity) {
    return UserProfileModel(
      id: entity.id,
      username: entity.username,
      gender: entity.gender,
      dateOfBirth: entity.dateOfBirth,
      biography: entity.biography,
      profileImage: entity.profileImage,
      profileImagePath: entity.profileImagePath,
    );
  }
  // Called when reading a document back from Firestore
  // json is whatever DocumentSnapshot.data() returns — a raw Map
  factory UserProfileModel.fromFirestore(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['uid'] as String,
      username: json['email'] as String,
      gender: json['gender'] as Gender,
      dateOfBirth: json['dateOfBirth'] as DateTime,
      biography: json['biography'] as String,
      // profileImage: json['profileImage'] as XFile,
      profileImagePath: json['profileImagePath'] as String,
    );
  }

  // ── FROM DRIFT ROW ─────────────────────────────────────────
  // Called in local datasource when reading from SQLite
  factory UserProfileModel.fromDrift(UserProfileTableData row) {
    return UserProfileModel(
      id: row.id,
      username: row.username,
      gender: row.gender,
      dateOfBirth: row.dateOfBirth,
      biography: row.biography,
      profileImagePath: row.profileImagePath,
    );
  }

  // ── TO DRIFT COMPANION ─────────────────────────────────────
  // Called in local datasource when writing to SQLite
  UserProfileTableData toDriftCompanion() {
    return UserProfileTableData(
      id: id,
      username: username,
      gender: gender,
      dateOfBirth: dateOfBirth,
      biography: biography,
      profileImagePath: profileImagePath,
    );
  }

  // ── TO ENTITY ──────────────────────────────────────────────
  // Explicit upcast — useful when a function expects UserEntity
  UserProfileEntity toEntity() {
    return UserProfileEntity(
      id: id,
      username: username,
      gender: gender as Gender,
      dateOfBirth: dateOfBirth,
      biography: biography,
      profileImagePath: profileImagePath,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'username': username,
      'gender': gender.toString(),
      'dateOfBirth': dateOfBirth,
      'biography': biography,
      'profileImage': profileImage.toString(),
      'profileImagePath': profileImagePath,
    };
  }
}
