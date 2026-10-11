import 'package:drift/drift.dart';

import 'habit_table.dart';

class HabitTargetTable extends Table {

  IntColumn get id => integer().references(HabitTable, #id)();

  TextColumn get type => text()();

  TextColumn get unit => text()();

  RealColumn get value => real()();

}