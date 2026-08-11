import 'package:cross_file/src/types/interface.dart';
import 'package:daily_win/core/error/exceptions.dart';
import 'package:daily_win/core/error/failures.dart';
import 'package:daily_win/features/profile_manager/data/datasource/local/profile_manager_local_datasource.dart';
import 'package:daily_win/features/profile_manager/data/datasource/remote/profle_manager_remote_datasource.dart';
import 'package:daily_win/features/profile_manager/domain/entities/user_profile_entity.dart';
import 'package:daily_win/features/profile_manager/domain/repositories/profile_manager_repository.dart';
import 'package:dartz/dartz.dart';

import '../models/user_profile_model.dart';

class ProfileManagerRepositoryImpl implements ProfileManagerRepository {

  final ProfileManagerLocalDatasource localDatasource;
  final ProfileManagerRemoteDatasource remoteDatasource;

  ProfileManagerRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource
  });

  @override
  Future<Either<Failure, UserProfileEntity>> createProfile(UserProfileEntity profile) async {
    try {
      final profileModel = UserProfileModel.fromEntity(profile);
      await remoteDatasource.createUserDocument(profileModel);
      await localDatasource.cacheUser(profileModel);
      return Right(profileModel.toEntity());
    } on ProfileException catch (e) {
      // Firestore failed — nothing was cached, clean state
      return Left(_mapProfileExceptionToFailure(e.message));
    } on CacheException catch (e) {
      // Firestore succeeded but Drift failed
      // profile exists on server — not catastrophic
      // you could log this and re-sync later
      return Left(UnknownFailure(message: e.message));
    }

  }

  @override
  Future<Either<Failure, UserProfileEntity?>> getProfile(String id) async {
    try {

      final cachedProfile = await localDatasource.getUser(id);
      if (cachedProfile != null) {
        return Right(cachedProfile);
      }

      final remoteProfile = await remoteDatasource.getUserDocument(id);
      if (remoteProfile == null) {
        // doesn't exist anywhere
        return const Right(null);
      }

      // await localDatasource.cacheUser(remoteProfile);

      return Right(remoteProfile);

    } on CacheException catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    } on ProfileException catch(e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  Failure _mapProfileExceptionToFailure(String message) {
    switch (message) {
      case 'profile-not-found':
        return const ProfileNotFoundFailure();
      case 'profile-already-exists':
        return const ProfileAlreadyExistsFailure();
      case 'photo-upload-failed':
        return const PhotoUploadFailure();
      default:
        return UnknownFailure(message: message);
    }
  }

}