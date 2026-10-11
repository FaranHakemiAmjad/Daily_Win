import 'package:daily_win/features/auth/data/datasource/local/tables/user_account_table.dart';
import 'package:daily_win/features/habit_manager/habit_mutation/domain/entities/habit_entity.dart';
import 'package:daily_win/features/profile_manager/data/datasource/local/tables/user_profile_table.dart';
import 'package:drift/drift.dart';

class HabitTable extends Table {

  IntColumn get id => integer().autoIncrement()();

  TextColumn get userID => text().references(UserAccountTable, #id)();

  TextColumn get username => text().references(UserProfileTable, #username)();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  TextColumn get category => text()();

  TextColumn get datasource => text()();

  DateTimeColumn get dateCreated => dateTime()();

  IntColumn get color => integer()();

  // @override
  // Set<Column> get primaryKey => {id};

}