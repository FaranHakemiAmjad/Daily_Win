import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../features/auth/data/datasource/local/daos/user_account_dao.dart';
import '../../features/auth/data/datasource/local/tables/user_account_table.dart';
import '../../features/profile_manager/data/datasource/local/daos/user_profile_dao.dart';
import '../../features/profile_manager/data/datasource/local/tables/user_profile_table.dart';
import '../../features/profile_manager/domain/entities/user_profile_entity.dart';

part 'app_database.g.dart';

// This annotation triggers code generation
// List every tables your app has here
@DriftDatabase(tables: [UserAccountTable, UserProfileTable],
    daos: [UserAccountDao, UserProfileDao])
class AppDatabase extends _$AppDatabase {

  AppDatabase() : super(_openConnection());

  // Increment this when you change your schema
  // Drift will run migration logic when version changes
  @override
  int get schemaVersion => 2;

  // Access your DAO like this: db.userDao.getCachedUser()
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll(); // creates all tables on first install
    },
    onUpgrade: (m, from, to) async {

      if(from <2) {
        await m.createTable(userProfileTable);
      }

      // if(from <3) {
      //   await m.addColumn(userAccountTable, userAccountTable.hasProfile as GeneratedColumn<Object>);
      // }
      // handle schema changes here when schemaVersion bumps
    },
  );
}

// Opens the actual SQLite file on device storage
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'daily_win.db'));
    return NativeDatabase.createInBackground(file);
  });
}