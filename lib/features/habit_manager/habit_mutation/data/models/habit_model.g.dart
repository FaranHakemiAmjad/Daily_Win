// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitModel _$HabitModelFromJson(Map<String, dynamic> json) => HabitModel(
  id: json['id'] as String,
  userID: json['uid'] as String,
  username: json['username'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  category: $enumDecode(_$HabitCategoryEnumMap, json['category']),
  dataSource: $enumDecode(_$HabitDataSourceEnumMap, json['dataSource']),
  dateCreated: const TimestampConverter().fromJson(
    json['dateCreated'] as Object,
  ),
  color: const ColorConverter().fromJson((json['color'] as num).toInt()),
  target: const HabitTargetConverter().fromJson(
    json['target'] as Map<String, dynamic>,
  ),
  schedule: const HabitScheduleConverter().fromJson(
    json['schedule'] as Map<String, dynamic>,
  ),
  reminders: const HabitReminderListConverter().fromJson(
    json['reminders'] as List?,
  ),
);

Map<String, dynamic> _$HabitModelToJson(
  HabitModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'title': instance.title,
  'description': instance.description,
  'category': _$HabitCategoryEnumMap[instance.category]!,
  'dataSource': _$HabitDataSourceEnumMap[instance.dataSource]!,
  'dateCreated': const TimestampConverter().toJson(instance.dateCreated),
  'uid': instance.userID,
  'color': const ColorConverter().toJson(instance.color),
  'target': const HabitTargetConverter().toJson(instance.target),
  'schedule': const HabitScheduleConverter().toJson(instance.schedule),
  'reminders': const HabitReminderListConverter().toJson(instance.reminders),
};

const _$HabitCategoryEnumMap = {
  HabitCategory.cardio: 'cardio',
  HabitCategory.hydration: 'hydration',
  HabitCategory.meditation: 'meditation',
  HabitCategory.study: 'study',
  HabitCategory.journal: 'journal',
  HabitCategory.read: 'read',
  HabitCategory.sleep: 'sleep',
  HabitCategory.custom: 'custom',
};

const _$HabitDataSourceEnumMap = {
  HabitDataSource.api: 'api',
  HabitDataSource.manual: 'manual',
  HabitDataSource.boolean: 'boolean',
};
