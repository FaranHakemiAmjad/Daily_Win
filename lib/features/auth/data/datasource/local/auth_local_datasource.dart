import '../../../../../core/database/app_database.dart';
import '../../../domain/entities/user_account_entity.dart';

import '../../models/user_account_model.dart';

abstract class AuthLocalDataSource {
  Future<UserAccountModel?> getCachedUser();
  Future<void> cacheUser(UserAccountModel user);
  Future<void> clearUser();
  // Future<bool?> hasProfile();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final AppDatabase db;

  AuthLocalDataSourceImpl({required this.db});

  @override
  Future<void> cacheUser(UserAccountModel user) {
    return db.userAccountDao.cacheUser(user.toDriftCompanion());
  }

  @override
  Future<void> clearUser() {
    return db.userAccountDao.clearUser();
  }

  @override
  Future<UserAccountModel?> getCachedUser() async {
    final row = await db.userAccountDao.getCachedUser();
    final user = UserAccountModel.fromDrift(row!);
    return user;
  }

  // @override
  // Future<bool?> hasProfile() async {
  //   final user = await getCachedUser();
  //   return user?.hasProfile;
  // }

}