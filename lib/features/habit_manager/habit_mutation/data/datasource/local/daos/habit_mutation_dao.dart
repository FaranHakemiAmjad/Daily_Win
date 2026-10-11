import 'package:daily_win/core/database/app_database.dart';
import 'package:drift/drift.dart';

import '../table/habit_reminder_table.dart';
import '../table/habit_schedule_table.dart';
import '../table/habit_table.dart';
import '../table/habit_target_table.dart';

part 'habit_mutation_dao.g.dart';

@DriftAccessor(tables: [HabitTable, HabitTargetTable, HabitScheduleTable, HabitReminderTable])
class HabitMutationDao extends DatabaseAccessor<AppDatabase> with _$HabitMutationDaoMixin{
  HabitMutationDao(super.db);
}