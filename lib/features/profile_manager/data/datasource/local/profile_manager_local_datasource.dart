import 'package:daily_win/core/database/app_database.dart';

import '../../models/user_profile_model.dart';

abstract class ProfileManagerLocalDatasource {
  Future<UserProfileModel?> getUser(String id);
  Future<void> cacheUser(UserProfileModel profile);
  Future<void> deleteUser(String id);
}

class ProfileManagerLocalDatasourceImpl extends ProfileManagerLocalDatasource {

  final AppDatabase db;

  ProfileManagerLocalDatasourceImpl({required this.db});

  @override
  Future<void> cacheUser(UserProfileModel profile) async {
    // Ensure parent account row exists in UserAccountTable to satisfy FK constraint
    // final userAccount = await db.userAccountDao.getCachedUser();
    // if (userAccount == null || userAccount.id != profile.id) {
    //   await db.userAccountDao.cacheUser(
    //     UserAccountTableData(
    //       id: profile.id,
    //       email: profile.username,
    //     ),
    //   );
    // }
    return db.userProfileDao.cacheUserProfile(profile.toDriftCompanion());
  }

  @override
  Future<void> deleteUser(String id) {
    return db.userProfileDao.deleteUser(id);
  }

  @override
  Future<UserProfileModel?> getUser(String id) async {
    final row = await db.userProfileDao.getUser(id);
    if (row == null) return null;
    final profile = UserProfileModel.fromDrift(row);
    return profile;
  }

}