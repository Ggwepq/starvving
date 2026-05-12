import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import '../models/schemas.dart';
import '../services/database_service.dart';
import '../services/tracking_service.dart';
import '../widgets/route_map_view.dart';
import 'activity_detail_screen.dart';
import 'insights_screen.dart';
import '../widgets/live_maplibre_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final DatabaseService _dbService = DatabaseService();
  List<Activity> _activities = [];
  bool _isLoadingHistory = true;
  bool _useMaplibreEngine = true; // default true to load local vector MBTiles map and live blue dot immediately

  @override
  void initState() {
    super.initState();
    _requestPermissionPreemptively();
    _loadActivities();
  }

  Future<void> _requestPermissionPreemptively() async {
    try {
      final perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
    } catch (_) {}
  }

  Future<void> _loadActivities() async {
    final acts = await _dbService.getActivities();
    if (mounted) {
      setState(() {
        _activities = acts;
        _isLoadingHistory = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111508),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111508),
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.gps_fixed, color: Color(0xFFC3F400)),
            const SizedBox(width: 8),
            Text(
              'STARVVING',
              style: GoogleFonts.barlowCondensed(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                color: const Color(0xFFC3F400),
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        actions: const [],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildLiveTrackingTab(context),
          _buildHistoryTab(context),
          InsightsScreen(key: ValueKey('insights_tab_$_currentIndex')),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFF282B1D), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF111508),
          selectedItemColor: const Color(0xFFC3F400),
          unselectedItemColor: const Color(0xFF8E9379),
          selectedLabelStyle: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (index == 1) {
              _loadActivities();
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.satellite_alt_outlined),
              activeIcon: Icon(Icons.satellite_alt_rounded),
              label: 'TRACK',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_toggle_off_rounded),
              activeIcon: Icon(Icons.history_rounded),
              label: 'HISTORY',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insights_outlined),
              activeIcon: Icon(Icons.insights_rounded),
              label: 'INSIGHTS',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveTrackingTab(BuildContext context) {
    return Consumer<TrackingService>(
      builder: (context, tracker, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dynamic Map Overview Canvas
              if (_useMaplibreEngine)
                LiveMaplibreView(points: tracker.currentRoute, height: 220)
              else
                RouteMapView(points: tracker.currentRoute, height: 220),
              const SizedBox(height: 12),

              // Map Engine Mode Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'RENDER ENGINE',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF8E9379),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _useMaplibreEngine = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: !_useMaplibreEngine
                                ? const Color(0xFF282B1D)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: !_useMaplibreEngine
                                  ? const Color(0xFFC3F400)
                                  : Colors.transparent,
                            ),
                          ),
                          child: Text(
                            'CANVAS',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: !_useMaplibreEngine
                                  ? const Color(0xFFC3F400)
                                  : const Color(0xFF8E9379),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => setState(() => _useMaplibreEngine = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _useMaplibreEngine
                                ? const Color(0xFF282B1D)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: _useMaplibreEngine
                                  ? const Color(0xFFC3F400)
                                  : Colors.transparent,
                            ),
                          ),
                          child: Text(
                            'MAPLIBRE',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: _useMaplibreEngine
                                  ? const Color(0xFFC3F400)
                                  : const Color(0xFF8E9379),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Modular Metric Grid View
              Row(
                children: [
                  Expanded(
                    child: _MetricBox(
                      label: 'PACE (AVG)',
                      value: tracker.formattedAvgPace,
                      unit: '/KM',
                      borderColor: const Color(0xFFC3F400),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _MetricBox(
                      label: 'DURATION',
                      value: tracker.formattedDuration,
                      unit: '',
                      borderColor: const Color(0xFFC3F400),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Primary Distance Card View
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2113),
                  borderRadius: BorderRadius.circular(12),
                  border: const Border(
                    left: BorderSide(color: Color(0xFFC3F400), width: 4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DISTANCE',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF8E9379),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              !tracker.isTracking
                                  ? Icons.gps_fixed_rounded
                                  : (tracker.isGpsLocked
                                      ? Icons.signal_cellular_alt_rounded
                                      : Icons.signal_cellular_off_rounded),
                              color: !tracker.isTracking
                                  ? const Color(0xFF8E9379)
                                  : (tracker.isGpsLocked
                                      ? const Color(0xFFC3F400)
                                      : Colors.orangeAccent),
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              !tracker.isTracking
                                  ? 'READY'
                                  : (tracker.isGpsLocked ? 'GPS LOCKED' : 'GPS SIGNAL'),
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: !tracker.isTracking
                                    ? const Color(0xFF8E9379)
                                    : (tracker.isGpsLocked
                                        ? const Color(0xFFC3F400)
                                        : Colors.orangeAccent),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          (tracker.distanceMeters / 1000.0).toStringAsFixed(2),
                          style: GoogleFonts.barlowCondensed(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'KM',
                          style: GoogleFonts.barlowCondensed(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF8E9379),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Tactical Laps & Controls Section
              if (tracker.isTracking) ...[
                // Current Lap status indicator
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF282B1D),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF444933)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'CURRENT LAP ${(tracker.lapSplits.length + 1).toString().padLeft(2, '0')}',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFC4C9AC),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: Color(0xFF8E9379),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          tracker.formattedCurrentLapDuration,
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Controls side-by-side
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 64,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFFFFB5A0),
                              width: 2,
                            ),
                            backgroundColor: const Color(0xFF1E2113),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(
                            Icons.timer_outlined,
                            color: Color(0xFFFFB5A0),
                          ),
                          label: Text(
                            'LAP',
                            style: GoogleFonts.barlowCondensed(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFFB5A0),
                              letterSpacing: 1.0,
                            ),
                          ),
                          onPressed: () => tracker.triggerLap(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: 64,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF93000A),
                            foregroundColor: const Color(0xFFFFDAD6),
                            side: const BorderSide(
                              color: Color(0xFFFFB4AB),
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.stop_circle_outlined),
                          label: Text(
                            'STOP',
                            style: GoogleFonts.barlowCondensed(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                          onPressed: () async {
                            final finishedAct = await tracker.stopTracking();
                            if (finishedAct != null && context.mounted) {
                              _loadActivities(); // refresh database lists
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActivityDetailScreen(
                                    activity: finishedAct,
                                  ),
                                ),
                              ).then((_) => _loadActivities());
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                // Primary Start Button
                SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC3F400),
                      foregroundColor: const Color(0xFF111508),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.play_arrow_rounded, size: 32),
                    label: Text(
                      'START TRACKING',
                      style: GoogleFonts.barlowCondensed(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    onPressed: () {
                      tracker.startTracking();
                    },
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildHistoryTab(BuildContext context) {
    if (_isLoadingHistory) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFFC3F400)),
      );
    }

    final totalRuns = _activities.length;
    final totalDistanceKms = _activities.fold<double>(
      0.0,
      (sum, act) => sum + (act.distanceMeters / 1000.0),
    );

    // Compute active streak (consecutive calendar days starting from latest runs)
    int streakDays = 0;
    if (_activities.isNotEmpty) {
      // sort distinct date components descending
      final distinctDates =
          _activities
              .map((a) => DateTime(a.startedAt.year, a.startedAt.month, a.startedAt.day))
              .toSet()
              .toList()
              ..sort((a, b) => b.compareTo(a));

      final today = DateTime.now();
      final todayDate = DateTime(today.year, today.month, today.day);

      // if latest run is today or yesterday, streak is at least 1
      DateTime expectedDate = distinctDates.first;
      if (expectedDate.isAtSameMomentAs(todayDate) ||
          expectedDate.isAtSameMomentAs(
            todayDate.subtract(const Duration(days: 1)),
          )) {
        streakDays = 1;
        for (int i = 1; i < distinctDates.length; i++) {
          final diff = distinctDates[i - 1].difference(distinctDates[i]).inDays;
          if (diff == 1) {
            streakDays++;
          } else {
            break;
          }
        }
      }
    }

    return RefreshIndicator(
      color: const Color(0xFFC3F400),
      backgroundColor: const Color(0xFF1E2113),
      onRefresh: _loadActivities,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gorgeous Premium Dashboard Insights overview banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF282B1D), Color(0xFF1E2113)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF333627)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _OverviewMetric(
                      label: 'TOTAL DIST',
                      value: totalDistanceKms.toStringAsFixed(1),
                      unit: 'KM',
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: const Color(0xFF444933),
                  ),
                  Expanded(
                    child: _OverviewMetric(
                      label: 'RECORDED',
                      value: '$totalRuns',
                      unit: 'RUNS',
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: const Color(0xFF444933),
                  ),
                  Expanded(
                    child: _OverviewMetric(
                      label: 'STREAK',
                      value: '$streakDays',
                      unit: 'DAYS',
                      valueColor: const Color(0xFFC3F400),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Text(
              'ACTIVITY ARCHIVE',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF8E9379),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),

            if (_activities.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.directions_run_rounded,
                        size: 64,
                        color: const Color(0xFF333627),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'NO RUNS RECORDED YET',
                        style: GoogleFonts.barlowCondensed(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF8E9379),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Start tracking offline runs to fill your logs.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF556774),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _activities.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final act = _activities[index];
                  final durationMins = act.durationSeconds ~/ 60;
                  final durationSecs = act.durationSeconds % 60;
                  final formattedDur =
                      "${durationMins.toString().padLeft(2, '0')}:${durationSecs.toString().padLeft(2, '0')}";

                  // Format average pace
                  String formattedPace = "--:--";
                  if (act.avgPaceSecPerKm > 0 && act.avgPaceSecPerKm <= 3600) {
                    final paceMins = act.avgPaceSecPerKm ~/ 60;
                    final paceSecs = (act.avgPaceSecPerKm % 60).floor();
                    formattedPace =
                        "${paceMins.toString().padLeft(2, '0')}:${paceSecs.toString().padLeft(2, '0')}";
                  }

                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivityDetailScreen(
                            activity: act,
                          ),
                        ),
                      ).then((deleted) {
                        if (deleted == true) {
                          _loadActivities();
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E2113),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF282B1D)),
                      ),
                      child: Row(
                        children: [
                          // Left side neon icon indicator
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF111508),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color(0xFF333627)),
                            ),
                            child: const Icon(
                              Icons.directions_run_rounded,
                              color: Color(0xFFC3F400),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Core Run Stats
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      (act.distanceMeters / 1000.0)
                                          .toStringAsFixed(2),
                                      style: GoogleFonts.barlowCondensed(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        height: 1.0,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'KM',
                                      style: GoogleFonts.barlowCondensed(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF8E9379),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 12,
                                      color: const Color(0xFF8E9379),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      formattedDur,
                                      style: GoogleFonts.jetBrainsMono(
                                        fontSize: 11,
                                        color: const Color(0xFFE2E4CF),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Icon(
                                      Icons.speed_rounded,
                                      size: 12,
                                      color: const Color(0xFF8E9379),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '$formattedPace/km',
                                      style: GoogleFonts.jetBrainsMono(
                                        fontSize: 11,
                                        color: const Color(0xFFE2E4CF),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Date Label
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                act.startedAt.toLocal().toString().split(' ')[0],
                                style: GoogleFonts.jetBrainsMono(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF556774),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF444933),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _MetricBox extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color borderColor;

  const _MetricBox({
    required this.label,
    required this.value,
    required this.unit,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2113),
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: borderColor, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8E9379),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: GoogleFonts.barlowCondensed(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.0,
                ),
              ),
              if (unit.isNotEmpty)
                Text(
                  unit,
                  style: GoogleFonts.barlowCondensed(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8E9379),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OverviewMetric extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final Color? valueColor;

  const _OverviewMetric({
    required this.label,
    required this.value,
    required this.unit,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF8E9379),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: GoogleFonts.barlowCondensed(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: valueColor ?? Colors.white,
                height: 1.0,
              ),
            ),
            const SizedBox(width: 2),
            Text(
              unit,
              style: GoogleFonts.barlowCondensed(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF8E9379),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
