import 'dart:io';

import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/user_profile_entity.dart';

class UserProfileState {
  final String username;
  final DateTime? birthDate;
  final Gender? gender;
  final XFile? profileImage;

  const UserProfileState({this.username = '', this.birthDate, this.gender, this.profileImage});

  UserProfileState copyWith({
    String? username,
    DateTime? birthDate,
    Gender? gender,
    XFile? profileImage,
  }) {
    return UserProfileState(
      username: username ?? this.username,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      profileImage: profileImage ?? this.profileImage
    );
  }
}

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  UserProfileNotifier() : super(const UserProfileState());

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
}

final userProfileProvider =
StateNotifierProvider<UserProfileNotifier, UserProfileState>(
      (ref) => UserProfileNotifier(),
);
