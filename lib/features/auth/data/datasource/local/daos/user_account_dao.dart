import 'package:drift/drift.dart';

import '../../../../../../core/database/app_database.dart';
import '../tables/user_account_table.dart';

part 'user_account_dao.g.dart';

@DriftAccessor(tables: [UserAccountTable])
class UserAccountDao extends DatabaseAccessor<AppDatabase> with _$UserAccountDaoMixin {

  UserAccountDao(super.db);

  Future<UserAccountTableData?> getCachedUser() {
    return (select(userAccountTable)..limit(1)).getSingleOrNull();
  }

  //
  // // Watch user as a stream — UI rebuilds automatically when data changes
  // Stream<UserTableData?> watchCachedUser() {
  //   return (select(userTable)..limit(1)).watchSingleOrNull();
  // }
  //

  Future<void> cacheUser(UserAccountTableData user) {
    return into(userAccountTable).insertOnConflictUpdate(user);
  }

  Future<void> clearUser() {
    return delete(userAccountTable).go();
  }

}