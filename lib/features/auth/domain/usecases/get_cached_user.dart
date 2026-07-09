import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_account_entity.dart';
import '../repositories/auth_repository.dart';

class GetCachedUserUseCase {
  final AuthRepository repository;
  const GetCachedUserUseCase({required this.repository});

  Future<Either<Failure, UserAccountEntity?>> call() {
    return repository.getCachedUser();
  }
}