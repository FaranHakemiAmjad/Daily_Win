import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_win/core/database/app_database.dart';
import 'package:daily_win/features/profile_manager/domain/entities/user_profile_entity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
@TimestampConverter()
class UserProfileModel extends UserProfileEntity {

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  XFile? get profileImage => super.profileImage;

  UserProfileModel({
    required super.uid,
    required super.username,
    required super.gender,
    required super.dateOfBirth,
    super.biography,
    super.profileImage,
    super.profileImageUrl,
  });

  factory UserProfileModel.fromEntity(UserProfileEntity entity) {
    return UserProfileModel(
      uid: entity.uid,
      username: entity.username,
      gender: entity.gender,
      dateOfBirth: entity.dateOfBirth,
      biography: entity.biography,
      profileImage: entity.profileImage,
      profileImageUrl: entity.profileImageUrl,
    );
  }

  UserProfileEntity toEntity() {
    return UserProfileEntity(
      uid: uid,
      username: username,
      gender: gender,
      dateOfBirth: dateOfBirth,
      biography: biography,
      profileImageUrl: profileImageUrl,
    );
  }
  // factory UserProfileModel.fromFirestore(Map<String, dynamic> json) {
  //   return UserProfileModel(
  //     uid: json['uid'] as String,
  //     username: json['username'] as String,
  //     gender: Gender.values.firstWhere((e) => e.name == json['gender']),
  //     dateOfBirth: json['dateOfBirth'] as DateTime,
  //     biography: json['biography'] as String,
  //     // profileImage: json['profileImage'] as XFile,
  //     profileImageUrl: json['profileImagePath'] as String,
  //   );
  // }

  factory UserProfileModel.fromDrift(UserProfileTableData row) {
    return UserProfileModel(
      uid: row.id,
      username: row.username,
      gender: row.gender,
      dateOfBirth: row.dateOfBirth,
      biography: row.biography,
      profileImageUrl: row.profileImagePath,
    );
  }

  UserProfileTableData toDriftCompanion() {
    return UserProfileTableData(
      id: uid,
      username: username,
      gender: gender,
      dateOfBirth: dateOfBirth,
      biography: biography,
      profileImagePath: profileImageUrl,
    );
  }

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);

  // Map<String, dynamic> toFirestore() {
  //   return {
  //     'uid': uid,
  //     'username': username,
  //     'gender': gender.name,
  //     'dateOfBirth': dateOfBirth,
  //     'biography': biography,
  //     'profileImage': profileImage.toString(),
  //     'profileImagePath': profileImageUrl,
  //   };
  // }
}

class TimestampConverter implements JsonConverter<DateTime, Object> {
  const TimestampConverter();

  @override
  DateTime fromJson(Object json) => (json as Timestamp).toDate();

  @override
  Object toJson(DateTime date) => Timestamp.fromDate(date);
}
