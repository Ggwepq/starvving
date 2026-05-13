import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/schemas.dart';
import '../services/database_service.dart';
import '../services/gpx_service.dart';
import '../services/settings_service.dart';
import '../widgets/live_maplibre_view.dart';

class ActivityDetailScreen extends StatefulWidget {
  final Activity activity;

  const ActivityDetailScreen({super.key, required this.activity});

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  final DatabaseService _dbService = DatabaseService();
  List<LocationPoint> _points = [];
  bool _isLoadingPoints = true;

  @override
  void initState() {
    super.initState();
    _loadBreadcrumbs();
  }

  Future<void> _loadBreadcrumbs() async {
    final points = await _dbService.getActivityPoints(widget.activity.id);
    if (mounted) {
      setState(() {
        _points = points;
        _isLoadingPoints = false;
      });
    }
  }

  String _formatDuration(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final mins = (totalSeconds % 3600) ~/ 60;
    final secs = totalSeconds % 60;
    if (hours > 0) {
      return "${hours.toString().padLeft(2, '0')}:${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
    }
    return "${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }


  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();
    final accentColor = settings.activeAccentColor;

    return Scaffold(
      backgroundColor: const Color(0xFF111508),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111508),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: accentColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'ACTIVITY SUMMARY #${widget.activity.id}',
          style: GoogleFonts.barlowCondensed(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: accentColor,
            letterSpacing: 1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFFFB4AB),
            ),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF1E2113),
                  title: Text(
                    'DELETE RUN?',
                    style: GoogleFonts.barlowCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Text(
                    'This offline track record will be permanently deleted.',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFE2E4CF),
                      fontSize: 14,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(
                        'CANCEL',
                        style: GoogleFonts.jetBrainsMono(color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        'DELETE',
                        style: GoogleFonts.jetBrainsMono(
                          color: const Color(0xFFFFB4AB),
                        ),
                      ),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                await _dbService.deleteActivity(widget.activity.id);
                if (context.mounted) {
                  Navigator.pop(context, true); // reload list
                }
              }
            },
          ),
        ],
      ),
      body: _isLoadingPoints
          ? Center(
              child: CircularProgressIndicator(color: accentColor),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Map Trajectory Card View
                  LiveMaplibreView(points: _points, height: 260, isLiveTracking: false),
                  const SizedBox(height: 20),

                  // Core Statistical Metrics Grid
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          label: 'DISTANCE',
                          value: settings.formatDistanceStr(widget.activity.distanceMeters),
                          unit: settings.unitSuffix.toUpperCase(),
                          color: accentColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          label: 'DURATION',
                          value: _formatDuration(
                            widget.activity.durationSeconds,
                          ),
                          unit: '',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          label: 'AVG PACE',
                          value: settings.formatPace(widget.activity.avgPaceSecPerKm),
                          unit: settings.paceUnitSuffix.toUpperCase(),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          label: 'DATE',
                          value: widget.activity.startedAt
                              .toLocal()
                              .toString()
                              .split(' ')[0],
                          unit: '',
                          color: Colors.white,
                          valueFontSize: 24,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Laps split breakdown section
                  if (widget.activity.lapSplits.isNotEmpty) ...[
                    Text(
                      'LAP SPLITS BREAKDOWN',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF8E9379),
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E2113),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF282B1D)),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.activity.lapSplits.length,
                        separatorBuilder: (context, index) => const Divider(
                          color: Color(0xFF282B1D),
                          height: 1,
                        ),
                        itemBuilder: (context, index) {
                          final splitSec = widget.activity.lapSplits[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'LAP ${(index + 1).toString().padLeft(2, '0')}',
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFE2E4CF),
                                  ),
                                ),
                                Text(
                                  _formatDuration(splitSec),
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: accentColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // GPX File Export button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        foregroundColor: const Color(0xFF111508),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.share_outlined, size: 24),
                      label: Text(
                        'EXPORT GPX TRACK',
                        style: GoogleFonts.barlowCondensed(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      onPressed: () async {
                        await GpxService.exportAndShareActivity(
                          widget.activity,
                          _points,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color color;
  final double valueFontSize;

  const _StatCard({
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
    this.valueFontSize = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2113),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF282B1D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF8E9379),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: GoogleFonts.barlowCondensed(
                    fontSize: valueFontSize,
                    fontWeight: FontWeight.bold,
                    color: color,
                    height: 1.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (unit.isNotEmpty)
                Text(
                  unit,
                  style: GoogleFonts.barlowCondensed(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFE2E4CF),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
