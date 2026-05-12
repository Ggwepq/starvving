import 'dart:io';
import 'package:gpx/gpx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/schemas.dart';

class GpxService {
  static Future<void> exportAndShareActivity(
    Activity activity,
    List<LocationPoint> points,
  ) async {
    final gpx = Gpx();
    gpx.creator = 'Starvving Offline Run Tracker';

    final trk = Trk(
      name:
          'Starvving Activity #${activity.id} (${activity.startedAt.toLocal().toString().split('.')[0]})',
    );
    final trkseg = Trkseg();

    for (final pt in points) {
      trkseg.trkpts.add(Wpt(lat: pt.lat, lon: pt.lng, time: pt.recordedAt));
    }

    trk.trksegs.add(trkseg);
    gpx.trks.add(trk);

    final gpxString = GpxWriter().asString(gpx, pretty: true);

    final tempDir = await getTemporaryDirectory();
    final fileName =
        'starvving_run_${activity.id}_${activity.startedAt.millisecondsSinceEpoch}.gpx';
    final filePath = '${tempDir.path}/$fileName';

    final file = File(filePath);
    await file.writeAsString(gpxString);

    // ignore: deprecated_member_use
    await Share.shareXFiles(
      [XFile(filePath)],
      text: 'Exported GPX Track from Starvving Run Tracker',
    );
  }
}
