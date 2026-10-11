import 'package:daily_win/features/habit_manager/habit_mutation/data/datasource/local/table/habit_table.dart';
import 'package:drift/drift.dart';

class HabitScheduleTable extends Table {

  IntColumn get id => integer().references(HabitTable, #id)();

  TextColumn get type => text()();

  TextColumn get weekdays => text().nullable()();

}