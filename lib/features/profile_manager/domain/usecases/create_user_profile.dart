import 'package:daily_win/core/error/failures.dart';
import 'package:daily_win/features/profile_manager/domain/entities/user_profile_entity.dart';
import 'package:daily_win/features/profile_manager/domain/repositories/profile_manager_repository.dart';
import 'package:dartz/dartz.dart';

class CreateUserProfileUseCase {
  final ProfileManagerRepository repository;
  const CreateUserProfileUseCase({required this.repository});

  Future<Either<Failure, UserProfileEntity>> call(UserProfileEntity profile) {
    return repository.createProfile(profile);
  }
}