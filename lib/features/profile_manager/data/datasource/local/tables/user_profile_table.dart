import 'package:daily_win/features/auth/data/datasource/local/tables/user_account_table.dart';
import 'package:drift/drift.dart';

import '../../../../domain/entities/user_profile_entity.dart';

class UserProfileTable extends Table{

  TextColumn get id => text().references(UserAccountTable, #id)();

  TextColumn get username => text()();

  TextColumn get gender => textEnum<Gender>()();

  DateTimeColumn get dateOfBirth => dateTime()();

  TextColumn get biography => text().nullable()();

  // Tells Drift which column is the primary key
  @override
  Set<Column> get primaryKey => {username};

}