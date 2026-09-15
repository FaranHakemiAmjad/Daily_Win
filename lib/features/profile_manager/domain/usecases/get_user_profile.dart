import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_profile_entity.dart';
import '../repositories/profile_manager_repository.dart';

class GetUserProfileUseCase {
  final ProfileManagerRepository repository;
  const GetUserProfileUseCase({required this.repository});

  Future<Either<Failure, UserProfileEntity?>> call(String id) {
    return repository.getProfile(id);
  }
}