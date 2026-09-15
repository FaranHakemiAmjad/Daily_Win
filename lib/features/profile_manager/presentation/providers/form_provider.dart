import 'dart:io';

import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/user_profile_entity.dart';

class UserProfileState {
  final String username;
  final DateTime birthDate;
  final Gender gender;
  final XFile? profileImage;
  final String? profileImagePath;
  final String? biography;

  const UserProfileState({
    this.username = '',
    required this.birthDate,
    required this.gender,
    this.profileImage,
    this.profileImagePath,
    this.biography,
  });

  UserProfileState copyWith({
    String? username,
    DateTime? birthDate,
    Gender? gender,
    XFile? profileImage,
    String? profileImagePath,
    String? biography,
  }) {
    return UserProfileState(
      username: username ?? this.username,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      profileImage: profileImage ?? this.profileImage,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      biography: biography ?? this.biography,
    );
  }
}

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  UserProfileNotifier()
    : super(
        UserProfileState(birthDate: DateTime.now(), gender: Gender.nonBinary),
      );

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setBirthDate(DateTime birthDate) {
    state = state.copyWith(birthDate: birthDate);
  }

  void setGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  void setProfileImage(XFile image) {
    state = state.copyWith(profileImage: image);
  }

  void setProfileImagePath(String path) {
    state = state.copyWith(profileImagePath: path);
  }

  void setBiography(String bio) {
    state = state.copyWith(biography: bio);
  }
}

final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>(
      (ref) => UserProfileNotifier(),
    );
