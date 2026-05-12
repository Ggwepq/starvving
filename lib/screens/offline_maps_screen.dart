// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/map_download_service.dart';

class OfflineMapsScreen extends StatefulWidget {
  const OfflineMapsScreen({super.key});

  @override
  State<OfflineMapsScreen> createState() => _OfflineMapsScreenState();
}

class _OfflineMapsScreenState extends State<OfflineMapsScreen> {
  final MapDownloadService _downloadService = MapDownloadService();

  @override
  void initState() {
    super.initState();
    _downloadService.addListener(_onServiceUpdate);
  }

  @override
  void dispose() {
    _downloadService.removeListener(_onServiceUpdate);
    super.dispose();
  }

  void _onServiceUpdate() {
    setState(() {});
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111508),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111508),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFC3F400)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'OFFLINE MAP REGIONS',
          style: GoogleFonts.barlowCondensed(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC3F400),
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tactical Storage Notice Banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2113),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF282B1D)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF111508),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.storage_rounded,
                    color: Color(0xFFC3F400),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOCAL VECTOR TILESETS',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Download compact multi-layer .mbtiles packages for fully operational mapping under zero-signal field conditions.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF8E9379),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Regions List View
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _downloadService.regions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final region = _downloadService.regions[index];
                final isDownloading =
                    region.status == RegionDownloadStatus.downloading;
                final isDownloaded =
                    region.status == RegionDownloadStatus.downloaded;

                double progress = 0.0;
                if (region.sizeBytes > 0) {
                  progress = region.downloadedBytes / region.sizeBytes;
                }

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1D10),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDownloaded
                          ? const Color(0xFFC3F400).withOpacity(0.4)
                          : const Color(0xFF282B1D),
                      width: isDownloaded ? 1.5 : 1.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      region.name.toUpperCase(),
                                      style: GoogleFonts.barlowCondensed(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    if (isDownloaded) ...[
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFC3F400)
                                              .withOpacity(0.15),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                            color: const Color(0xFFC3F400),
                                          ),
                                        ),
                                        child: Text(
                                          'ACTIVE',
                                          style: GoogleFonts.jetBrainsMono(
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFFC3F400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  region.description,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: const Color(0xFFE2E4CF),
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Download / Offload Interaction Affordance
                          if (isDownloaded)
                            IconButton(
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Color(0xFFFFB4AB),
                              ),
                              tooltip: 'Delete Region Files',
                              onPressed: () {
                                _downloadService.deleteRegion(region.id);
                              },
                            )
                          else if (isDownloading)
                            SizedBox(
                              width: 36,
                              height: 36,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value: progress,
                                    strokeWidth: 3,
                                    backgroundColor: const Color(0xFF282B1D),
                                    color: const Color(0xFFC3F400),
                                  ),
                                  Text(
                                    '${(progress * 100).toInt()}%',
                                    style: GoogleFonts.jetBrainsMono(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFC3F400),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFC3F400),
                                foregroundColor: const Color(0xFF111508),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(
                                Icons.download_rounded,
                                size: 16,
                              ),
                              label: Text(
                                'SEED',
                                style: GoogleFonts.barlowCondensed(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                _downloadService.downloadRegion(region.id);
                              },
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: Color(0xFF282B1D), height: 1),
                      const SizedBox(height: 12),

                      // Size metrics indicator footer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'BUNDLE SIZE',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF8E9379),
                            ),
                          ),
                          Text(
                            isDownloading
                                ? '${_formatBytes(region.downloadedBytes)} / ${_formatBytes(region.sizeBytes)}'
                                : _formatBytes(region.sizeBytes),
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: isDownloaded
                                  ? const Color(0xFFC3F400)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
