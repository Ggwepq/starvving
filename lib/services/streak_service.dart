import '../models/schemas.dart';

class StreakMetrics {
  final int currentStreak;
  final int longestStreak;
  final double totalDistanceMeters;
  final int totalDurationSeconds;
  final Set<DateTime> activeDays;

  StreakMetrics({
    required this.currentStreak,
    required this.longestStreak,
    required this.totalDistanceMeters,
    required this.totalDurationSeconds,
    required this.activeDays,
  });

  double get totalDistanceKm => totalDistanceMeters / 1000.0;
}

class StreakService {
  /// Computes core gamification statistics and consistency tracking metrics
  /// from a complete list of recorded [Activity] instances.
  static StreakMetrics calculateMetrics(List<Activity> activities) {
    double totalDistance = 0.0;
    int totalDuration = 0;
    final Set<DateTime> activeDays = {};

    for (final act in activities) {
      totalDistance += act.distanceMeters;
      totalDuration += act.durationSeconds;
      // Normalize timestamp to midnight local time to prevent timezone boundary offsets
      activeDays.add(DateTime(act.startedAt.year, act.startedAt.month, act.startedAt.day));
    }

    if (activeDays.isEmpty) {
      return StreakMetrics(
        currentStreak: 0,
        longestStreak: 0,
        totalDistanceMeters: 0.0,
        totalDurationSeconds: 0,
        activeDays: {},
      );
    }

    // Sort normalized distinct active days chronologically
    final List<DateTime> sortedDays = activeDays.toList()..sort();

    int currentStreak = 0;
    int longestStreak = 0;

    int tempStreak = 1;
    longestStreak = 1;

    for (int i = 1; i < sortedDays.length; i++) {
      final prev = sortedDays[i - 1];
      final curr = sortedDays[i];

      final difference = curr.difference(prev).inDays;
      if (difference == 1) {
        tempStreak++;
        if (tempStreak > longestStreak) {
          longestStreak = tempStreak;
        }
      } else {
        tempStreak = 1;
      }
    }

    // Evaluate if the active sequence extends to the current calendar day
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    final lastActiveDay = sortedDays.last;

    final daysFromToday = normalizedToday.difference(lastActiveDay).inDays;
    if (daysFromToday == 0) {
      // Last run was today, trace streak backwards from the end
      currentStreak = 1;
      for (int i = sortedDays.length - 1; i > 0; i--) {
        if (sortedDays[i].difference(sortedDays[i - 1]).inDays == 1) {
          currentStreak++;
        } else {
          break;
        }
      }
    } else if (daysFromToday == 1) {
      // Last run was yesterday, current streak is still alive
      currentStreak = 1;
      for (int i = sortedDays.length - 1; i > 0; i--) {
        if (sortedDays[i].difference(sortedDays[i - 1]).inDays == 1) {
          currentStreak++;
        } else {
          break;
        }
      }
    } else {
      // Streak broken
      currentStreak = 0;
    }

    return StreakMetrics(
      currentStreak: currentStreak,
      longestStreak: longestStreak,
      totalDistanceMeters: totalDistance,
      totalDurationSeconds: totalDuration,
      activeDays: activeDays,
    );
  }
}
