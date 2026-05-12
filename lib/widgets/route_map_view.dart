// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'dart:math';
import '../models/schemas.dart';

class RouteMapView extends StatelessWidget {
  final List<LocationPoint> points;
  final double height;

  const RouteMapView({super.key, required this.points, this.height = 240});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0C0F04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF282B1D), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Subtle tactical grid background pattern
          CustomPaint(
            size: Size.infinite,
            painter: _GridBackgroundPainter(),
          ),

          // Render live trajectory if points available
          if (points.isNotEmpty)
            CustomPaint(
              size: Size.infinite,
              painter: _TrajectoryPainter(points),
            )
          else
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.satellite_alt_outlined,
                    color: const Color(0xFF556774).withOpacity(0.5),
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'AWAITING GPS BREADCRUMBS',
                    style: TextStyle(
                      fontFamily: 'JetBrains Mono',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: const Color(0xFF556774).withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

          // Tactical HUD overlay details
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF111508).withOpacity(0.8),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFF333627)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: points.isNotEmpty
                          ? const Color(0xFFC3F400)
                          : Colors.orangeAccent,
                      shape: BoxShape.circle,
                      boxShadow: points.isNotEmpty
                          ? [
                              const BoxShadow(
                                color: Color(0xFFC3F400),
                                blurRadius: 4,
                              ),
                            ]
                          : null,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    points.isNotEmpty
                        ? '${points.length} PTS'
                        : 'OFFLINE MAP',
                    style: const TextStyle(
                      fontFamily: 'JetBrains Mono',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE2E4CF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1A1D10)
      ..strokeWidth = 1.0;

    const double spacing = 24.0;

    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TrajectoryPainter extends CustomPainter {
  final List<LocationPoint> points;

  _TrajectoryPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    // Calculate bounding box for dynamic auto-scaling path
    double minLat = points.first.lat;
    double maxLat = points.first.lat;
    double minLng = points.first.lng;
    double maxLng = points.first.lng;

    for (final pt in points) {
      if (pt.lat < minLat) minLat = pt.lat;
      if (pt.lat > maxLat) maxLat = pt.lat;
      if (pt.lng < minLng) minLng = pt.lng;
      if (pt.lng > maxLng) maxLng = pt.lng;
    }

    // Add padding to bounds
    final latRange = max(maxLat - minLat, 0.00001);
    final lngRange = max(maxLng - minLng, 0.00001);

    // Padding around path inside canvas
    const padding = 20.0;
    final drawWidth = size.width - padding * 2;
    final drawHeight = size.height - padding * 2;

    Offset getPixelOffset(LocationPoint pt) {
      // Invert lat so increasing lat goes upwards (standard map)
      final x = padding + ((pt.lng - minLng) / lngRange) * drawWidth;
      final y = padding +
          (1.0 - ((pt.lat - minLat) / latRange)) * drawHeight;
      return Offset(x, y);
    }

    final path = Path();
    final startOffset = getPixelOffset(points.first);
    path.moveTo(startOffset.dx, startOffset.dy);

    for (int i = 1; i < points.length; i++) {
      final offset = getPixelOffset(points[i]);
      path.lineTo(offset.dx, offset.dy);
    }

    // Outer glow for premium breadcrumb visual
    final glowPaint = Paint()
      ..color = const Color(0xFFC3F400).withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Inner bright neon path line
    final linePaint = Paint()
      ..color = const Color(0xFFC3F400)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, glowPaint);
    canvas.drawPath(path, linePaint);

    // Draw end point marker icon
    final lastOffset = getPixelOffset(points.last);
    final endMarkerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final endMarkerBorderPaint = Paint()
      ..color = const Color(0xFFC3F400)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(lastOffset, 5.0, endMarkerPaint);
    canvas.drawCircle(lastOffset, 5.0, endMarkerBorderPaint);
  }

  @override
  bool shouldRepaint(covariant _TrajectoryPainter oldDelegate) {
    return oldDelegate.points.length != points.length;
  }
}
