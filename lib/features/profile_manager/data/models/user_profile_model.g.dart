// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      uid: json['uid'] as String,
      username: json['username'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      dateOfBirth: const TimestampConverter().fromJson(
        json['dateOfBirth'] as Object,
      ),
      biography: json['biography'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'gender': _$GenderEnumMap[instance.gender]!,
      'dateOfBirth': const TimestampConverter().toJson(instance.dateOfBirth),
      'biography': instance.biography,
      'profileImageUrl': instance.profileImageUrl,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.nonBinary: 'nonBinary',
};
