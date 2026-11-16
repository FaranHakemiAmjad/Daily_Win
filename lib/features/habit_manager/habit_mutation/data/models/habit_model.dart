import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_win/core/database/app_database.dart';
import 'package:daily_win/features/habit_manager/habit_mutation/domain/entities/habit_entity.dart';
import 'package:daily_win/features/profile_manager/data/models/user_profile_model.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'habit_model.g.dart';



@JsonSerializable(explicitToJson: true)
@TimestampConverter()
class HabitModel extends HabitEntity {
  @JsonKey(name: 'uid')
  @override
  final String userID;

  @ColorConverter()
  @override
  final Color color;

  @HabitTargetConverter()
  @override
  final HabitTarget target;

  @HabitScheduleConverter()
  @override
  final HabitSchedule schedule;

  @HabitReminderListConverter()
  @override
  final List<HabitReminder>? reminders;

  HabitModel({
    required super.id,
    required this.userID,
    required super.username,
    required super.title,
    super.description,
    required super.category,
    required super.dataSource,
    required super.dateCreated,
    required this.color,
    required this.target,
    required this.schedule,
    this.reminders,
  }) : super(
          userID: userID,
          color: color,
          target: target,
          schedule: schedule,
          reminders: reminders,
        );

  // ── JSON SERIALIZABLE CONNECTORS ───────────────────────────

  factory HabitModel.fromJson(Map<String, dynamic> json) =>
      _$HabitModelFromJson(json);

  Map<String, dynamic> toJson() => _$HabitModelToJson(this);

  // ── FIRESTORE MAPPINGS ─────────────────────────────────────

  factory HabitModel.fromFirestore(Map<String, dynamic> json) =>
      HabitModel.fromJson(json);

  Map<String, dynamic> toFirestore() => toJson();

  // ── ENTITY MAPPINGS ────────────────────────────────────────

  factory HabitModel.fromEntity(HabitEntity entity) {
    return HabitModel(
      id: entity.id,
      userID: entity.userID,
      username: entity.username,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      dataSource: entity.dataSource,
      dateCreated: entity.dateCreated,
      color: entity.color,
      target: entity.target,
      schedule: entity.schedule,
      reminders: entity.reminders,
    );
  }

  HabitEntity toEntity() {
    return HabitEntity(
      id: id,
      userID: userID,
      username: username,
      title: title,
      description: description,
      category: category,
      dataSource: dataSource,
      dateCreated: dateCreated,
      color: color,
      target: target,
      schedule: schedule,
      reminders: reminders,
    );
  }

  // ── DRIFT MAPPINGS ─────────────────────────────────────────

  factory HabitModel.fromDrift({
    required HabitTableData habitTable,
    HabitTargetTableData? targetTable,
    HabitScheduleTableData? scheduleTable,
    List<HabitReminderTableData>? reminderTables,
  })
  {
    HabitTarget target = BooleanTarget();
    if (targetTable != null && targetTable.type == 'numeric') {
      final unit = HabitUnit.values.firstWhere(
        (e) => e.name == jsonTargetUnit(targetTable.unit),
        orElse: () => HabitUnit.none,
      );
      target = NumericTarget(value: targetTable.value, unit: unit);
    }

    HabitSchedule schedule = DailySchedule();
    if (scheduleTable != null && scheduleTable.type == 'weekly') {
      final weekdaysString = scheduleTable.weekdays ?? '';
      final days = weekdaysString
          .split(',')
          .where((s) => s.isNotEmpty)
          .map((dayName) => Weekday.values.firstWhere((w) => w.name == dayName))
          .toSet();
      schedule = WeeklySchedule(days: days);
    }

    final reminders = reminderTables
            ?.map((r) => HabitReminder(
                  enabled: r.enabled,
                  hour: r.hour,
                  minute: r.minute,
                ))
            .toList() ??
        const [];

    return HabitModel(
      id: habitTable.id.toString(),
      userID: habitTable.userID,
      username: habitTable.username,
      title: habitTable.title,
      description: habitTable.description,
      category: HabitCategory.values.firstWhere(
        (e) => e.name == habitTable.category,
        orElse: () => HabitCategory.custom,
      ),
      dataSource: HabitDataSource.values.firstWhere(
        (e) => e.name == habitTable.datasource,
        orElse: () => HabitDataSource.manual,
      ),
      dateCreated: habitTable.dateCreated,
      color: Color(habitTable.color),
      target: target,
      schedule: schedule,
      reminders: reminders,
    );
  }

  static String jsonTargetUnit(String unitStr) => unitStr;

  HabitTableData toDriftCompanion() {
    return HabitTableData(
      id: int.parse(id),
      userID: userID,
      username: username,
      title: title,
      description: description,
      category: category.label,
      datasource: dataSource.name,
      dateCreated: dateCreated,
      color: color.toARGB32(),
    );
  }
}

// Converters ------------------------------------------------------------------

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.toARGB32();
}

class HabitTargetConverter
    implements JsonConverter<HabitTarget, Map<String, dynamic>> {
  const HabitTargetConverter();

  @override
  HabitTarget fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'numeric') {
      final unit = HabitUnit.values.firstWhere(
            (e) => e.name == json['unit'],
        orElse: () => HabitUnit.none,
      );
      return NumericTarget(
        value: (json['value'] as num).toDouble(),
        unit: unit,
      );
    }
    return BooleanTarget();
  }

  @override
  Map<String, dynamic> toJson(HabitTarget target) {
    return switch (target) {
      NumericTarget(:final value, :final unit) => {
        'type': 'numeric',
        'value': value,
        'unit': unit.name,
      },
      BooleanTarget() => {
        'type': 'boolean',
      },
    };
  }
}

class HabitScheduleConverter
    implements JsonConverter<HabitSchedule, Map<String, dynamic>> {
  const HabitScheduleConverter();

  @override
  HabitSchedule fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'weekly') {
      final daysList = (json['days'] as List?)?.cast<String>() ?? [];
      final days = daysList
          .map((dayName) => Weekday.values.firstWhere((w) => w.name == dayName))
          .toSet();
      return WeeklySchedule(days: days);
    }
    return DailySchedule();
  }

  @override
  Map<String, dynamic> toJson(HabitSchedule schedule) {
    return switch (schedule) {
      DailySchedule() => {
        'type': 'daily',
      },
      WeeklySchedule(:final days) => {
        'type': 'weekly',
        'days': days.map((d) => d.name).toList(),
      },
    };
  }
}

class HabitReminderListConverter
    implements JsonConverter<List<HabitReminder>?, List<dynamic>?> {
  const HabitReminderListConverter();

  @override
  List<HabitReminder>? fromJson(List<dynamic>? json) {
    if (json == null) return null;
    return json.map((item) {
      final map = item as Map<String, dynamic>;
      return HabitReminder(
        enabled: map['enabled'] as bool? ?? true,
        hour: map['hour'] as int,
        minute: map['minute'] as int,
      );
    }).toList();
  }

  @override
  List<dynamic>? toJson(List<HabitReminder>? object) {
    if (object == null) return null;
    return object
        .map((r) => {
      'enabled': r.enabled,
      'hour': r.hour,
      'minute': r.minute,
    })
        .toList();
  }
}
