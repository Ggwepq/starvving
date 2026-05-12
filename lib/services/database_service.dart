import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/schemas.dart';

class DatabaseService {
  static late Isar isar;
  static bool _isInitialized = false;

  static Future<void> init() async {
    if (_isInitialized) return;
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [ActivitySchema, LocationPointSchema],
      directory: dir.path,
    );
    _isInitialized = true;
  }

  // Create a new activity record when tracking starts
  Future<Activity> createActivity() async {
    final activity = Activity()
      ..startedAt = DateTime.now()
      ..endedAt = DateTime.now()
      ..distanceMeters = 0.0
      ..durationSeconds = 0
      ..avgPaceSecPerKm = 0.0
      ..lapSplits = [];

    await isar.writeTxn(() async {
      await isar.activitys.put(activity);
    });

    return activity;
  }

  // Append a list of location points in bulk or individually
  Future<void> saveLocationPoint(LocationPoint point) async {
    await isar.writeTxn(() async {
      await isar.locationPoints.put(point);
    });
  }

  // Update activity final metrics upon completion
  Future<void> updateActivity(Activity activity) async {
    await isar.writeTxn(() async {
      await isar.activitys.put(activity);
    });
  }

  // Get all recorded activities sorted by date descending
  Future<List<Activity>> getActivities() async {
    return await isar.activitys.where().sortByStartedAtDesc().findAll();
  }

  // Get breadcrumb points for a given activity
  Future<List<LocationPoint>> getActivityPoints(int activityId) async {
    return await isar.locationPoints
        .filter()
        .activityIdEqualTo(activityId)
        .sortByRecordedAt()
        .findAll();
  }

  // Delete an activity and its associated breadcrumbs
  Future<void> deleteActivity(int activityId) async {
    await isar.writeTxn(() async {
      await isar.activitys.delete(activityId);
      await isar.locationPoints
          .filter()
          .activityIdEqualTo(activityId)
          .deleteAll();
    });
  }
}
