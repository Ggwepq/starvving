import 'package:isar/isar.dart';

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
  late DateTime recordedAt;
}
