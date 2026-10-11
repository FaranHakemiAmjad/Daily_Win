import 'package:drift/drift.dart';

import 'habit_table.dart';

class HabitReminderTable extends Table {

  IntColumn get id => integer().references(HabitTable, #id)();

  BoolColumn get enabled => boolean()();

  IntColumn get hour => integer()();

  IntColumn get minute => integer()();
}