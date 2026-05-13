import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/schemas.dart';
import '../utils/rdp_compression.dart';

class DatabaseService {
  static late Isar isar;
  static bool _isInitialized = false;

  static Future<void> init() async {
    if (_isInitialized) return;
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      ActivitySchema,
      LocationPointSchema,
      LapSplitSchema,
      AppSettingsSchema,
    ], directory: dir.path);
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

  // Retrieve comprehensive local storage footprint metrics
  Future<Map<String, dynamic>> getStorageMetrics() async {
    final activitiesCount = await isar.activitys.count();
    final pointsCount = await isar.locationPoints.count();

    // Approximate row allocation overhead in bytes
    final estimatedBytes = (activitiesCount * 128) + (pointsCount * 36);

    return {
      'activitiesCount': activitiesCount,
      'pointsCount': pointsCount,
      'estimatedBytes': estimatedBytes,
    };
  }

  // Apply batch RDP compression to location point sequences older than maxAge
  Future<int> applyStorageRetentionPolicy(
    Duration maxAge,
    double epsilonMeters,
  ) async {
    final thresholdDate = DateTime.now().subtract(maxAge);
    final oldActivities = await isar.activitys
        .filter()
        .startedAtLessThan(thresholdDate)
        .findAll();

    int totalReclaimed = 0;

    for (final act in oldActivities) {
      final points = await getActivityPoints(act.id);
      // Only compress dense raw sequences to preserve already-optimized paths
      if (points.length > 50) {
        final compressed = RdpCompression.compress(points, epsilonMeters);
        final pointsRemoved = points.length - compressed.length;

        if (pointsRemoved > 0) {
          await isar.writeTxn(() async {
            // Flush uncompressed original rows
            await isar.locationPoints
                .filter()
                .activityIdEqualTo(act.id)
                .deleteAll();

            // Insert fresh compressed entities
            final optimizedPoints = compressed
                .map(
                  (p) => LocationPoint()
                    ..activityId = act.id
                    ..lat = p.lat
                    ..lng = p.lng
                    ..accuracyMeters = p.accuracyMeters
                    ..altitudeMeters = p.altitudeMeters
                    ..recordedAt = p.recordedAt,
                )
                .toList();

            await isar.locationPoints.putAll(optimizedPoints);
          });

          totalReclaimed += pointsRemoved;
        }
      }
    }

    return totalReclaimed;
  }

  // Retrieve or initialize application settings singleton
  Future<AppSettings> getSettings() async {
    var settings = await isar.appSettings.get(1);
    if (settings == null) {
      settings = AppSettings();
      await isar.writeTxn(() async {
        await isar.appSettings.put(settings!);
      });
    }
    return settings;
  }

  // Persist updated app settings instance
  Future<void> saveSettings(AppSettings settings) async {
    await isar.writeTxn(() async {
      await isar.appSettings.put(settings);
    });
  }

  // Clear all local records (Destroy Local Data procedure)
  Future<void> destroyAllLocalData() async {
    await isar.writeTxn(() async {
      await isar.activitys.clear();
      await isar.locationPoints.clear();
      await isar.lapSplits.clear();
      // Keep appSettings cleanly reset to default state
      final defaultSettings = AppSettings();
      await isar.appSettings.put(defaultSettings);
    });
  }
}
