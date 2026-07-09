import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;
  const SignOutUseCase({required this.repository});

  Future<Either<Failure, void>> call() {
    return repository.signOut();
  }
}