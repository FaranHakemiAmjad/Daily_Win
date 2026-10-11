// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_mutation_dao.dart';

// ignore_for_file: type=lint
mixin _$HabitMutationDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserAccountTableTable get userAccountTable =>
      attachedDatabase.userAccountTable;
  $UserProfileTableTable get userProfileTable =>
      attachedDatabase.userProfileTable;
  $HabitTableTable get habitTable => attachedDatabase.habitTable;
  $HabitTargetTableTable get habitTargetTable =>
      attachedDatabase.habitTargetTable;
  $HabitScheduleTableTable get habitScheduleTable =>
      attachedDatabase.habitScheduleTable;
  $HabitReminderTableTable get habitReminderTable =>
      attachedDatabase.habitReminderTable;
  HabitMutationDaoManager get managers => HabitMutationDaoManager(this);
}

class HabitMutationDaoManager {
  final _$HabitMutationDaoMixin _db;
  HabitMutationDaoManager(this._db);
  $$UserAccountTableTableTableManager get userAccountTable =>
      $$UserAccountTableTableTableManager(
        _db.attachedDatabase,
        _db.userAccountTable,
      );
  $$UserProfileTableTableTableManager get userProfileTable =>
      $$UserProfileTableTableTableManager(
        _db.attachedDatabase,
        _db.userProfileTable,
      );
  $$HabitTableTableTableManager get habitTable =>
      $$HabitTableTableTableManager(_db.attachedDatabase, _db.habitTable);
  $$HabitTargetTableTableTableManager get habitTargetTable =>
      $$HabitTargetTableTableTableManager(
        _db.attachedDatabase,
        _db.habitTargetTable,
      );
  $$HabitScheduleTableTableTableManager get habitScheduleTable =>
      $$HabitScheduleTableTableTableManager(
        _db.attachedDatabase,
        _db.habitScheduleTable,
      );
  $$HabitReminderTableTableTableManager get habitReminderTable =>
      $$HabitReminderTableTableTableManager(
        _db.attachedDatabase,
        _db.habitReminderTable,
      );
}
