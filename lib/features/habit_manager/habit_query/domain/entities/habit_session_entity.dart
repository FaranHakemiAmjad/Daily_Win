class HabitSessionEntity {
  final String id;
  final String habitId;
  final String userId;
  final DateTime loggedAt;
  final double value;

  const HabitSessionEntity({
    required this.id,
    required this.habitId,
    required this.userId,
    required this.loggedAt,
    required this.value,
  });
}