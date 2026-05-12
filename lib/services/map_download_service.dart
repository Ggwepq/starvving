import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

enum RegionDownloadStatus { notDownloaded, downloading, downloaded }

class OfflineRegion {
  final String id;
  final String name;
  final String description;
  final int sizeBytes;
  RegionDownloadStatus status;
  int downloadedBytes;

  OfflineRegion({
    required this.id,
    required this.name,
    required this.description,
    required this.sizeBytes,
    this.status = RegionDownloadStatus.notDownloaded,
    this.downloadedBytes = 0,
  });
}

class MapDownloadService extends ChangeNotifier {
  static final MapDownloadService _instance = MapDownloadService._internal();
  factory MapDownloadService() => _instance;
  MapDownloadService._internal() {
    _init();
  }

  final List<OfflineRegion> _regions = [
    OfflineRegion(
      id: 'mnl_metro',
      name: 'Metro Manila Vectors',
      description: 'High-density urban multi-layer map bundle with tracks.',
      sizeBytes: 142000000, // ~142 MB
    ),
    OfflineRegion(
      id: 'ceb_central',
      name: 'Cebu & Visayas Central',
      description: 'Coastal trails, mountain vectors, and city grids.',
      sizeBytes: 89000000, // ~89 MB
    ),
    OfflineRegion(
      id: 'dvo_gulf',
      name: 'Davao Gulf Sector',
      description: 'Southern Highlands topography and street geometries.',
      sizeBytes: 115000000, // ~115 MB
    ),
  ];

  List<OfflineRegion> get regions => _regions;

  final Map<String, StreamSubscription> _activeDownloads = {};

  Future<void> _init() async {
    // Check local storage for pre-existing tile files
    final dir = await getApplicationDocumentsDirectory();
    for (final region in _regions) {
      final file = File('${dir.path}/${region.id}.mbtiles');
      if (await file.exists()) {
        region.status = RegionDownloadStatus.downloaded;
        region.downloadedBytes = region.sizeBytes;
      }
    }
    notifyListeners();
  }

  // Trigger high performance mock byte stream download
  Future<void> downloadRegion(String regionId) async {
    final region = _regions.firstWhere((r) => r.id == regionId);
    if (region.status != RegionDownloadStatus.notDownloaded) return;

    region.status = RegionDownloadStatus.downloading;
    region.downloadedBytes = 0;
    notifyListeners();

    final totalChunks = 50;
    final bytesPerChunk = region.sizeBytes ~/ totalChunks;

    _activeDownloads[regionId] = Stream.periodic(
      const Duration(milliseconds: 100),
      (count) => (count + 1),
    ).take(totalChunks).listen((chunkIndex) async {
      region.downloadedBytes = chunkIndex * bytesPerChunk;
      notifyListeners();

      if (chunkIndex == totalChunks) {
        region.downloadedBytes = region.sizeBytes;
        region.status = RegionDownloadStatus.downloaded;

        // Persist real binary footprint file to local disk
        try {
          final dir = await getApplicationDocumentsDirectory();
          final file = File('${dir.path}/${region.id}.mbtiles');
          await file.writeAsBytes(List.filled(1024, 0)); // touch indicator
        } catch (e) {
          if (kDebugMode) print('Error writing MBTiles indicator: $e');
        }

        _activeDownloads.remove(regionId);
        notifyListeners();
      }
    });
  }

  // Delete local cached region data
  Future<void> deleteRegion(String regionId) async {
    final region = _regions.firstWhere((r) => r.id == regionId);
    _activeDownloads[regionId]?.cancel();
    _activeDownloads.remove(regionId);

    region.status = RegionDownloadStatus.notDownloaded;
    region.downloadedBytes = 0;

    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/${region.id}.mbtiles');
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      if (kDebugMode) print('Error deleting MBTiles file: $e');
    }

    notifyListeners();
  }

  // Retrieve validated active offline path if downloaded
  Future<String?> getOfflineTilesPath(String regionId) async {
    final region = _regions.firstWhere((r) => r.id == regionId);
    if (region.status == RegionDownloadStatus.downloaded) {
      final dir = await getApplicationDocumentsDirectory();
      return '${dir.path}/${region.id}.mbtiles';
    }
    return null;
  }
}
