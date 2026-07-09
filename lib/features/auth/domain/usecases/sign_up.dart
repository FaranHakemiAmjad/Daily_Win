import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_account_entity.dart';
import '../repositories/auth_repository.dart';

class SignUpParams {
  final String email;
  final String password;
  const SignUpParams({required this.email, required this.password});
}

class SignUpUseCase {
  final AuthRepository repository;
  const SignUpUseCase({required this.repository});

  Future<Either<Failure, UserAccountEntity>> call(SignUpParams params) {
    return repository.signUp(
      email: params.email,
      password: params.password,
    );
  }
}