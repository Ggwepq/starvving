import 'package:stravving/models/schemas.dart';
import 'dart:math' as math;

class RdpCompression {
  /// Compresses a dense list of [LocationPoint] using the Ramer-Douglas-Peucker algorithm.
  /// [epsilonMeters] defines the maximum allowable perpendicular deviation in meters.
  static List<LocationPoint> compress(List<LocationPoint> points, double epsilonMeters) {
    if (points.length < 3) return points;

    int dmaxIndex = 0;
    double dmax = 0.0;

    final first = points.first;
    final last = points.last;

    // Approximate meters per degree based on average latitude of the segment
    final double latAvgRad = (first.lat + last.lat) / 2.0 * math.pi / 180.0;
    const double metersPerDegLat = 111320.0;
    final double metersPerDegLng = 111320.0 * math.cos(latAvgRad);

    final double bx = (last.lng - first.lng) * metersPerDegLng;
    final double by = (last.lat - first.lat) * metersPerDegLat;
    final double l2 = bx * bx + by * by;

    for (int i = 1; i < points.length - 1; i++) {
      final p = points[i];
      final double px = (p.lng - first.lng) * metersPerDegLng;
      final double py = (p.lat - first.lat) * metersPerDegLat;

      double d = 0.0;
      if (l2 == 0.0) {
        d = math.sqrt(px * px + py * py);
      } else {
        // Compute projection parameter t clamped to [0, 1] segment bounds
        final double t = math.max(0.0, math.min(1.0, (px * bx + py * by) / l2));
        final double projX = t * bx;
        final double projY = t * by;
        final double dx = px - projX;
        final double dy = py - projY;
        d = math.sqrt(dx * dx + dy * dy);
      }

      if (d > dmax) {
        dmaxIndex = i;
        dmax = d;
      }
    }

    // If max distance is greater than epsilon, recursively simplify
    if (dmax > epsilonMeters) {
      final List<LocationPoint> results1 = compress(points.sublist(0, dmaxIndex + 1), epsilonMeters);
      final List<LocationPoint> results2 = compress(points.sublist(dmaxIndex), epsilonMeters);

      // Combine result lists while avoiding duplication of the pivot point
      final List<LocationPoint> combined = [];
      combined.addAll(results1.sublist(0, results1.length - 1));
      combined.addAll(results2);
      return combined;
    } else {
      return [first, last];
    }
  }
}
