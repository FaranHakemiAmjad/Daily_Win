import 'package:image_picker/image_picker.dart';

enum Gender { male, female, nonBinary }

class UserProfileEntity {
  final String uid;
  final String username;
  final Gender gender;
  final DateTime dateOfBirth;
  final String? biography;
  final XFile? profileImage;
  final String? profileImageUrl;

  UserProfileEntity({
    required this.uid,
    required this.username,
    required this.gender,
    required this.dateOfBirth,
    this.biography,
    this.profileImage,
    this.profileImageUrl,
  });
}
