import 'package:daily_win/features/profile_manager/domain/entities/user_profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/error/failures.dart';

abstract class ProfileManagerRepository {
  Future<Either<Failure, UserProfileEntity>> createProfile(UserProfileEntity profile);

  Future<Either<Failure, UserProfileEntity?>> getProfile(String id);
}
