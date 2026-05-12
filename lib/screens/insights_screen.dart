import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/schemas.dart';
import '../services/database_service.dart';
import '../services/streak_service.dart';
import 'manage_storage_screen.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  final DatabaseService _dbService = DatabaseService();
  late Future<List<Activity>> _activitiesFuture;
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() {
    setState(() {
      _activitiesFuture = _dbService.getActivities();
    });
  }

  String _formatDuration(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111508),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111508),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'PERFORMANCE INSIGHTS',
          style: GoogleFonts.barlowCondensed(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC3F400),
            letterSpacing: 1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.storage_rounded, color: Color(0xFF8E9379)),
            tooltip: 'Manage Database Storage',
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageStorageScreen(),
                ),
              );
              // Refresh metrics upon return if storage operations altered datasets
              _refreshData();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Activity>>(
        future: _activitiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFC3F400)),
            );
          }

          final activities = snapshot.data ?? [];
          final metrics = StreakService.calculateMetrics(activities);

          return RefreshIndicator(
            color: const Color(0xFFC3F400),
            backgroundColor: const Color(0xFF1E2113),
            onRefresh: () async => _refreshData(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // High-Impact Gamification Stat Blocks
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          title: 'CURRENT STREAK',
                          value: '${metrics.currentStreak}',
                          unit: metrics.currentStreak == 1 ? 'DAY' : 'DAYS',
                          icon: Icons.local_fire_department_rounded,
                          iconColor: const Color(0xFFFFB4AB),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          title: 'LONGEST STREAK',
                          value: '${metrics.longestStreak}',
                          unit: metrics.longestStreak == 1 ? 'DAY' : 'DAYS',
                          icon: Icons.emoji_events_rounded,
                          iconColor: const Color(0xFFC3F400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          title: 'CUMULATIVE DISTANCE',
                          value: metrics.totalDistanceKm.toStringAsFixed(1),
                          unit: 'KM',
                          icon: Icons.route_rounded,
                          iconColor: const Color(0xFFC3F400),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          title: 'TOTAL DURATION',
                          value: _formatDuration(metrics.totalDurationSeconds),
                          unit: '',
                          icon: Icons.timer_rounded,
                          iconColor: const Color(0xFF8E9379),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Section Header
                  Text(
                    'ACTIVITY CALENDAR HEAT-MAP',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF8E9379),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Custom Heat-map TableCalendar Panel
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1D10),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF282B1D)),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2035, 12, 31),
                      focusedDay: _focusedDay,
                      currentDay: DateTime.now(),
                      calendarFormat: CalendarFormat.month,
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                      },
                      headerStyle: HeaderStyle(
                        titleTextStyle: GoogleFonts.barlowCondensed(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                        formatButtonVisible: false,
                        leftChevronIcon: const Icon(
                          Icons.chevron_left,
                          color: Color(0xFFC3F400),
                        ),
                        rightChevronIcon: const Icon(
                          Icons.chevron_right,
                          color: Color(0xFFC3F400),
                        ),
                        titleCentered: true,
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: GoogleFonts.jetBrainsMono(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF8E9379),
                        ),
                        weekendStyle: GoogleFonts.jetBrainsMono(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF8E9379),
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                        weekendTextStyle: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.6),
                        ),
                        outsideDaysVisible: false,
                        todayDecoration: BoxDecoration(
                          color: const Color(0xFF282B1D),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF8E9379).withValues(alpha: 0.5),
                          ),
                        ),
                        todayTextStyle: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      // Implement Option A uniform premium cell indicators via custom builders
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          final normalizedDay = DateTime(day.year, day.month, day.day);
                          final isActive = metrics.activeDays.contains(normalizedDay);

                          if (isActive) {
                            return Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFC3F400).withValues(alpha: 0.15),
                                border: Border.all(
                                  color: const Color(0xFFC3F400),
                                  width: 1.5,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${day.day}',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFC3F400),
                                ),
                              ),
                            );
                          }
                          return null; // Fallback to standard style rules
                        },
                        todayBuilder: (context, day, focusedDay) {
                          final normalizedDay = DateTime(day.year, day.month, day.day);
                          final isActive = metrics.activeDays.contains(normalizedDay);

                          if (isActive) {
                            return Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFC3F400),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${day.day}',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF111508),
                                ),
                              ),
                            );
                          }
                          return null; // Let default today layout rules govern
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color iconColor,
  }) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF8E9379),
                ),
              ),
              Icon(icon, size: 16, color: iconColor),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: GoogleFonts.barlowCondensed(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4),
                Text(
                  unit,
                  style: GoogleFonts.barlowCondensed(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFC3F400),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
