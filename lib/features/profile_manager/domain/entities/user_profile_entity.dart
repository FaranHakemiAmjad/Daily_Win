enum Gender { male, female}

class UserProfileEntity {
  final String id;
  final String username;
  final Gender gender;
  final DateTime? dateOfBirth;
  final String? biography;

  UserProfileEntity({
    required this.id,
    required this.username,
    required this.gender,
    required this.dateOfBirth,
    required this.biography,
  });
}
