import 'package:isar_community/isar.dart';

part 'schemas.g.dart';

@collection
class Activity {
  Id id = Isar.autoIncrement;

  late DateTime startedAt;
  late DateTime endedAt;
  late double distanceMeters;
  late int durationSeconds; // continuous wall-clock elapsed time
  late double avgPaceSecPerKm;

  // Store split seconds for each lap triggered during the run
  List<int> lapSplits = [];

  // Expanded performance metrics and customization
  double elevationGainMeters = 0.0;
  int estimatedCalories = 0;
  double paceVariancePercent = 0.0;
  String activityType = 'run';
  String accentColor = 'lime';

  final laps = IsarLinks<LapSplit>();

  bool synced = false;
  bool exportedToStrava = false;
}

@collection
class LocationPoint {
  Id id = Isar.autoIncrement;

  @Index()
  late int activityId;

  late double lat;
  late double lng;
  late double accuracyMeters;
  double altitudeMeters = 0.0;
  late DateTime recordedAt;
}

@collection
class LapSplit {
  Id id = Isar.autoIncrement;

  @Index()
  late int activityId;

  late int lapNumber;
  late int splitDurationSeconds;
  late double splitDistanceMeters;
  late DateTime markedAt;
}

@collection
class AppSettings {
  Id id = 1; // Singleton row

  String accentColor = 'lime'; // "lime" | "orange" | "crimson"
  String units = 'metric'; // "metric" | "imperial"
  double monthlyGoalKm = 50.0;

  String? stravaAccessToken;
  String? stravaUsername;
  bool supabaseEnabled = false;
}
