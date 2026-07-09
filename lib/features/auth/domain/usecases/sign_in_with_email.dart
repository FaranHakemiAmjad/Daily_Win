import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_account_entity.dart';
import '../repositories/auth_repository.dart';

class SignInWithEmailParams {
  final String email;
  final String password;
  const SignInWithEmailParams({required this.email, required this.password});
}

class SignInWithEmailUseCase {
  final AuthRepository repository;
  const SignInWithEmailUseCase({required this.repository});

  Future<Either<Failure, UserAccountEntity>> call(SignInWithEmailParams params) {
    return repository.signInWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}