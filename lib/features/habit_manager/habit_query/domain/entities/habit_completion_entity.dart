class HabitCompletionEntity {
  final String id;
  final String habitId;
  final String userId;
  final DateTime date;
  final bool isCompleted;
  final double? actualValue;

  const HabitCompletionEntity({
  required this.id,
  required this.habitId,
  required this.userId,
  required this.date,
  required this.isCompleted,
  this.actualValue,
  });
}
