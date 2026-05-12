// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import '../models/schemas.dart';

class LiveMaplibreView extends StatefulWidget {
  final List<LocationPoint> points;
  final double height;

  const LiveMaplibreView({
    super.key,
    required this.points,
    this.height = 260,
  });

  @override
  State<LiveMaplibreView> createState() => _LiveMaplibreViewState();
}

class _LiveMaplibreViewState extends State<LiveMaplibreView> {
  MapLibreMapController? _mapController;
  Line? _trajectoryLine;

  static const String _tacticalStyleJson = '''
{
  "version": 8,
  "name": "Starvving Tactical Dark",
  "sources": {},
  "layers": [
    {
      "id": "background",
      "type": "background",
      "paint": {
        "background-color": "#111508"
      }
    }
  ]
}
''';

  @override
  void didUpdateWidget(covariant LiveMaplibreView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.points.length != widget.points.length &&
        _mapController != null) {
      _updateTrajectory();
    }
  }

  Future<void> _updateTrajectory() async {
    if (widget.points.isEmpty || _mapController == null) return;

    final latlngs =
        widget.points.map((p) => LatLng(p.lat, p.lng)).toList();

    if (_trajectoryLine == null) {
      try {
        _trajectoryLine = await _mapController!.addLine(
          LineOptions(
            geometry: latlngs,
            lineColor: '#C3F400',
            lineWidth: 5.0,
            lineOpacity: 0.9,
            lineJoin: 'round',
          ),
        );
      } catch (e) {
        // Line addition might fail if map style isn't fully idle yet
      }
    } else {
      try {
        await _mapController!.updateLine(
          _trajectoryLine!,
          LineOptions(geometry: latlngs),
        );
      } catch (e) {
        // Recreate line gracefully if pointer lost
        _trajectoryLine = null;
      }
    }

    // Smoothly pan camera to follow latest coordinate stream
    if (latlngs.isNotEmpty) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(latlngs.last),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine initial startup target location
    LatLng initialTarget = const LatLng(14.5547, 121.0244); // Metro Manila seed base
    if (widget.points.isNotEmpty) {
      initialTarget = LatLng(
        widget.points.last.lat,
        widget.points.last.lng,
      );
    }

    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF282B1D), width: 1.5),
      ),
      // Clip behavior ensures map renderer doesn't spill outside rounded borders
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          MapLibreMap(
            styleString: _tacticalStyleJson,
            initialCameraPosition: CameraPosition(
              target: initialTarget,
              zoom: 16.0,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
              _updateTrajectory();
            },
            myLocationEnabled: false,
            compassEnabled: false,
          ),

          // Tactical mode indicator overlay matching Option A design specification
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2113).withOpacity(0.85),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFF333627)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.map_outlined,
                    size: 12,
                    color: Color(0xFFC3F400),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'MAPLIBRE NATIVE ENGINE',
                    style: TextStyle(
                      fontFamily: 'JetBrains Mono',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
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
