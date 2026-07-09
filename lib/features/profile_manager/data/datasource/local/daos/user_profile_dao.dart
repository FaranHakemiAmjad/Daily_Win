import 'package:daily_win/core/database/app_database.dart';
import 'package:drift/drift.dart';

import '../tables/user_profile_table.dart';

part 'user_profile_dao.g.dart';

@DriftAccessor(tables: [UserProfileTable])
class UserProfileDao extends DatabaseAccessor<AppDatabase> {
  UserProfileDao(super.attachedDatabase);
}