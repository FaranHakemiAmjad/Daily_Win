import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_account_entity.dart';

abstract class AuthRepository {
  // Returns cached user if exists — used for offline auth check
  Future<Either<Failure, UserAccountEntity?>> getCachedUser();

  Future<Either<Failure, UserAccountEntity>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserAccountEntity>> signUp({
    required String email,
    required String password,
  });

  // Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, bool>> hasProfile();
}