import 'package:daily_win/features/auth/data/datasource/remote/auth_firestore_datasource.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user_account_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/local/auth_local_datasource.dart';
import '../datasource/remote/auth_firebase_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final AuthFirestoreDataSource firestoreDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource, required this.firestoreDataSource,
  });

  @override
  Future<Either<Failure, UserAccountEntity?>> getCachedUser() async {
    try {
      final user = await localDataSource.getCachedUser();
      return Right(user);
    } on CacheException catch (e) {
      return Left(UnknownFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserAccountEntity>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final authUser = await remoteDataSource.signInWithEmail(
        email: email,
        password: password,
      );

      // final user = await firestoreDataSource.getUserDocument(authUser.uid);

      await localDataSource.cacheUser(authUser);

      return Right(authUser);

    } on AuthException catch (e) {
      return Left(_mapAuthExceptionToFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserAccountEntity>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signUp(
        email: email,
        password: password,
      );
      await localDataSource.cacheUser(user);

      await firestoreDataSource.createUserDocument(user);

      return Right(user);

    } on AuthException catch (e) {
      return Left(_mapAuthExceptionToFailure(e.message));
    }
  }

  // ── GOOGLE SIGN IN ───────────────────────────────────────────
  // @override
  // Future<Either<Failure, UserEntity>> signInWithGoogle() async {
  //   try {
  //     final user = await remoteDataSource.signInWithGoogle();
  //     await localDataSource.cacheUser(user);
  //     return Right(user);
  //
  //   } on AuthException catch (e) {
  //     return Left(_mapAuthExceptionToFailure(e.message));
  //   }
  // }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearUser();
      return const Right(null);

    } on AuthException catch (e) {
      return Left(UnknownFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> hasProfile() {
    // TODO: implement hasProfile
    throw UnimplementedError();
  }

  Failure _mapAuthExceptionToFailure(String code) {
    switch (code) {
      case 'invalid-email':
        return const InvalidEmailFailure();
      case 'wrong-password':
      case 'invalid-credential':
        return const WrongPasswordFailure();
      case 'user-not-found':
        return const UserNotFoundFailure();
      case 'email-already-in-use':
        return const EmailAlreadyInUseFailure();
      case 'google-sign-in-cancelled':
        return const GoogleSignInCancelledFailure();
      default:
        return UnknownFailure(message: code);
    }
  }

}