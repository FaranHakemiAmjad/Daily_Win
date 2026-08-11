import 'dart:io';

import 'package:image_picker/image_picker.dart';

enum Gender { male, female, nonBinary }

class UserProfileEntity {
  final String id;
  final String username;
  final Gender gender;
  final DateTime dateOfBirth;
  final String? biography;
  final XFile? profileImage;
  final String? profileImagePath;

  UserProfileEntity({
    required this.id,
    required this.username,
    required this.gender,
    required this.dateOfBirth,
    this.biography,
    this.profileImage,
    this.profileImagePath,
  });
}
