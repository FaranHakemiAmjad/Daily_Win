import 'package:daily_win/features/profile_manager/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.id,
    required super.username,
    required super.gender,
    required super.dateOfBirth,
    required super.biography,
  });
}
