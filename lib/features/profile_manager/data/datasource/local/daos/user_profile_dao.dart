import 'package:daily_win/core/database/app_database.dart';
import 'package:drift/drift.dart';

import '../tables/user_profile_table.dart';

part 'user_profile_dao.g.dart';

@DriftAccessor(tables: [UserProfileTable])
class UserProfileDao extends DatabaseAccessor<AppDatabase>
    with _$UserProfileDaoMixin {
  UserProfileDao(super.db);

  Future<void> cacheUserProfile(UserProfileTableData profile) {
    return into(userProfileTable).insertOnConflictUpdate(profile);
  }

  Future<UserProfileTableData?> getUser(String id) {
    return (select(
      userProfileTable,
    )..where((table) => table.id.equals(id))).getSingleOrNull();
  }

  Future<void> deleteUser(String id) async {
    await (delete(userProfileTable)
      ..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
