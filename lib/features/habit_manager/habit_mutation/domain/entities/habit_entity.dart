import 'dart:ui';

class HabitEntity {
  final String id;
  final String userID;
  final String username;
  final String title;
  final String? description;
  final HabitCategory category;
  final HabitDataSource dataSource;
  final DateTime dateCreated;
  final Color color;
  final HabitTarget target;
  final HabitSchedule schedule;
  final HabitReminder? reminder;

  HabitEntity.name({
    required this.id,
    required this.userID,
    required this.username,
    required this.title,
    this.description,
    required this.category,
    required this.dataSource,
    required this.dateCreated,
    required this.color,
    required this.target,
    required this.schedule,
    this.reminder
  });
}

// -----------------------------------------------------------------------------

enum HabitUnit {
  steps,
  kilometers,
  miles,
  minutes,
  hours,
  liters,
  glasses,
  sessions,
  pages,
  none,
}

extension HabitUnitExtension on HabitUnit {
  String get label {
    switch (this) {
      case HabitUnit.steps:
        return 'Steps';
      case HabitUnit.kilometers:
        return 'Kilometers';
      case HabitUnit.miles:
        return 'Miles';
      case HabitUnit.minutes:
        return 'Minutes';
      case HabitUnit.hours:
        return 'Hours';
      case HabitUnit.liters:
        return 'Liters';
      case HabitUnit.glasses:
        return 'Glasses';
      case HabitUnit.sessions:
        return 'Sessions';
      case HabitUnit.pages:
        return 'Pages';
      case HabitUnit.none:
        return 'Completion';
    }
  }
}

enum HabitCategory {
  cardio,
  hydration,
  meditation,
  study,
  journal,
  read,
  sleep,
  custom,
}

extension HabitCategoryExtension on HabitCategory {
  String get label {
    switch (this) {
      case HabitCategory.cardio:
        return 'Cardio';
      case HabitCategory.hydration:
        return 'Hydration';
      case HabitCategory.meditation:
        return 'Meditation';
      case HabitCategory.study:
        return 'Study';
      case HabitCategory.journal:
        return 'Journal';
      case HabitCategory.read:
        return 'Read';
      case HabitCategory.sleep:
        return 'Sleep';
      case HabitCategory.custom:
        return 'Custom';
    }
  }

  HabitDataSource get dataSource {
    switch (this) {
      case HabitCategory.cardio:
        return HabitDataSource.api;
      case HabitCategory.hydration:
        return HabitDataSource.manual;
      case HabitCategory.meditation:
        return HabitDataSource.boolean;
      case HabitCategory.study:
        return HabitDataSource.manual;
      case HabitCategory.journal:
        return HabitDataSource.boolean;
      case HabitCategory.sleep:
        return HabitDataSource.manual;
      case HabitCategory.read:
        return HabitDataSource.manual;
      case HabitCategory.custom:
        return HabitDataSource.boolean;
    }
  }

  List<HabitUnit> get availableUnits {
    switch (this) {
      case HabitCategory.cardio:
        return [
          HabitUnit.steps,
          HabitUnit.kilometers,
          HabitUnit.miles,
          HabitUnit.minutes,
          HabitUnit.hours,
        ];
      case HabitCategory.hydration:
        return [HabitUnit.liters, HabitUnit.glasses];
      case HabitCategory.meditation:
        return [HabitUnit.minutes, HabitUnit.sessions, HabitUnit.none];
      case HabitCategory.study:
        return [
          HabitUnit.hours,
          HabitUnit.minutes,
          HabitUnit.pages,
          HabitUnit.sessions,
          HabitUnit.none,
        ];
      case HabitCategory.journal:
        return [HabitUnit.pages, HabitUnit.none];
      case HabitCategory.read:
        return [HabitUnit.pages, HabitUnit.sessions, HabitUnit.none];
      case HabitCategory.sleep:
        return [HabitUnit.hours, HabitUnit.minutes];
      case HabitCategory.custom:
        return [HabitUnit.none];
    }
  }

  HabitUnit get defaultUnit => availableUnits.first;
}

// -----------------------------------------------------------------------------

sealed class HabitTarget {
  const HabitTarget();
}

class NumericTarget extends HabitTarget {
  final double value;
  final HabitUnit unit;
  const NumericTarget({required this.value, required this.unit});
}

class BooleanTarget extends HabitTarget {
  const BooleanTarget();
}

// -----------------------------------------------------------------------------

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

sealed class HabitSchedule {
  const HabitSchedule();
}

class DailySchedule extends HabitSchedule {
  const DailySchedule();
}

class WeeklySchedule extends HabitSchedule {
  final Set<Weekday> days;

  const WeeklySchedule({
    required this.days,
  });
}

class HabitReminder {
  final bool enabled;
  final int hour;
  final int minute;

  const HabitReminder({
    this.enabled = true,
    required this.hour,
    required this.minute,
  });
}

// -----------------------------------------------------------------------------

enum HabitDataSource { api, manual, boolean }
