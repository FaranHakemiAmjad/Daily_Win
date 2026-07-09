import 'package:drift/drift.dart';

// This class defines the "users" tables in SQLite
// It does NOT hold data — it's just the schema blueprint
class UserAccountTable extends Table {

  // TEXT column, primary key, not auto-incremented
  // because Firebase gives us the uid as a string
  TextColumn get id => text()();

  TextColumn get email => text()();

  DateTimeColumn get lastSyncedAt => dateTime().nullable()();

  // BoolColumn? get hasProfile => boolean()();

  // Tells Drift which column is the primary key
  @override
  Set<Column> get primaryKey => {id};
}