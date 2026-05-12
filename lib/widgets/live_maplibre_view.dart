// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
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
  String? _resolvedStyleString;
  bool _isUnpacking = false;
  LatLng _initialTarget = const LatLng(14.5547, 121.0244); // default Metro Manila

  @override
  void initState() {
    super.initState();
    _prepareOfflineMapEngine();
  }

  Future<void> _prepareOfflineMapEngine() async {
    // 1. Determine optimized initial viewport (physical sensor or route sets)
    if (widget.points.isNotEmpty) {
      _initialTarget = LatLng(widget.points.last.lat, widget.points.last.lng);
    } else {
      try {
        final pos = await Geolocator.getLastKnownPosition() ??
            await Geolocator.getCurrentPosition(
              locationSettings: const LocationSettings(
                timeLimit: Duration(seconds: 2),
              ),
            );
        _initialTarget = LatLng(pos.latitude, pos.longitude);
      } catch (_) {}
    }

    // 2. Unpack bundled 432MB offline OpenMapTiles database asset locally
    try {
      final dir = await getApplicationDocumentsDirectory();
      final targetFile = File('${dir.path}/osm_philippines_v3.mbtiles');

      if (!targetFile.existsSync()) {
        if (mounted) {
          setState(() {
            _isUnpacking = true;
          });
        }
        final byteData = await rootBundle.load(
          'assets/maps/osm-2020-02-10-v3.11_asia_philippines.mbtiles',
        );
        await targetFile.writeAsBytes(
          byteData.buffer.asUint8List(
            byteData.offsetInBytes,
            byteData.lengthInBytes,
          ),
          flush: true,
        );
      }

      // 3. Assemble dynamic MapLibre offline vector style targeting SQLite source
      final styleString = '''
{
  "version": 8,
  "name": "Starvving Bundled Vector Dark",
  "sources": {
    "openmaptiles": {
      "type": "vector",
      "url": "mbtiles://${targetFile.path}"
    }
  },
  "layers": [
    {
      "id": "background",
      "type": "background",
      "paint": {
        "background-color": "#111508"
      }
    },
    {
      "id": "water",
      "type": "fill",
      "source": "openmaptiles",
      "source-layer": "water",
      "paint": {
        "fill-color": "#0B1D1A"
      }
    },
    {
      "id": "transportation",
      "type": "line",
      "source": "openmaptiles",
      "source-layer": "transportation",
      "paint": {
        "line-color": "#28332A",
        "line-width": 1.5
      }
    },
    {
      "id": "building",
      "type": "fill",
      "source": "openmaptiles",
      "source-layer": "building",
      "paint": {
        "fill-color": "#1A2416",
        "fill-opacity": 0.6
      }
    },
    {
      "id": "boundary",
      "type": "line",
      "source": "openmaptiles",
      "source-layer": "boundary",
      "paint": {
        "line-color": "#333627",
        "line-width": 1.0,
        "line-dasharray": [2, 2]
      }
    }
  ]
}
''';

      if (mounted) {
        setState(() {
          _resolvedStyleString = styleString;
          _isUnpacking = false;
        });
      }
    } catch (e) {
      // Fallback minimalist canvas base if direct SQLite IO access fails
      if (mounted) {
        setState(() {
          _resolvedStyleString = '''
{
  "version": 8,
  "name": "Starvving Base Fallback",
  "sources": {},
  "layers": [
    {
      "id": "background",
      "type": "background",
      "paint": { "background-color": "#111508" }
    }
  ]
}
''';
          _isUnpacking = false;
        });
      }
    }
  }

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
        // Line addition might queue if engine is still compiling style vectors
      }
    } else {
      try {
        await _mapController!.updateLine(
          _trajectoryLine!,
          LineOptions(geometry: latlngs),
        );
      } catch (e) {
        _trajectoryLine = null;
      }
    }

    if (latlngs.isNotEmpty) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLng(latlngs.last),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF282B1D), width: 1.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: _isUnpacking
          ? _buildUnpackingOverlay()
          : (_resolvedStyleString == null
              ? const Center(
                  child: CircularProgressIndicator(color: Color(0xFFC3F400)),
                )
              : Stack(
                  children: [
                    MapLibreMap(
                      styleString: _resolvedStyleString!,
                      initialCameraPosition: CameraPosition(
                        target: _initialTarget,
                        zoom: 16.0,
                      ),
                      onMapCreated: (controller) {
                        _mapController = controller;
                        _updateTrajectory();
                      },
                      myLocationEnabled: true, // Native physical position live blue dot continuously active
                      compassEnabled: false,
                    ),

                    // Tactical mode active database overlay HUD badge
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E2113).withOpacity(0.85),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFF333627)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.storage_rounded,
                              size: 12,
                              color: Color(0xFFC3F400),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'BUNDLED OFFLINE DATABASE ACTIVE',
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
                )),
    );
  }

  Widget _buildUnpackingOverlay() {
    return Container(
      color: const Color(0xFF111508),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: Color(0xFFC3F400)),
          const SizedBox(height: 16),
          Text(
            'UNPACKING OFFLINE MAP DATABASE...',
            style: TextStyle(
              fontFamily: 'JetBrains Mono',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFC3F400),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Extracting bundled vector terrain assets locally for continuous sub-millisecond mapping rendering.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 11,
              color: const Color(0xFF8E9379),
            ),
          ),
        ],
      ),
    );
  }
}
