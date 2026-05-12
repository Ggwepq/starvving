import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/database_service.dart';

class ManageStorageScreen extends StatefulWidget {
  const ManageStorageScreen({super.key});

  @override
  State<ManageStorageScreen> createState() => _ManageStorageScreenState();
}

class _ManageStorageScreenState extends State<ManageStorageScreen> {
  final DatabaseService _dbService = DatabaseService();
  Map<String, dynamic>? _metrics;
  bool _isLoading = true;
  bool _isProcessing = false;
  double _epsilon = 5.0;
  int? _lastReclaimedCount;

  @override
  void initState() {
    super.initState();
    _fetchMetrics();
  }

  Future<void> _fetchMetrics() async {
    setState(() {
      _isLoading = true;
    });
    final data = await _dbService.getStorageMetrics();
    if (mounted) {
      setState(() {
        _metrics = data;
        _isLoading = false;
      });
    }
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Future<void> _executeCompression({bool simulateAll = false}) async {
    setState(() {
      _isProcessing = true;
      _lastReclaimedCount = null;
    });

    // Use zero duration if simulating over all sessions for instantaneous test capability
    final targetDuration = simulateAll ? Duration.zero : const Duration(days: 90);
    final reclaimed = await _dbService.applyStorageRetentionPolicy(targetDuration, _epsilon);

    await _fetchMetrics();

    if (mounted) {
      setState(() {
        _isProcessing = false;
        _lastReclaimedCount = reclaimed;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF1E2113),
          content: Text(
            reclaimed > 0
                ? 'Optimization complete! Reclaimed $reclaimed coordinate rows.'
                : 'Database already completely optimized at current epsilon threshold.',
            style: GoogleFonts.inter(color: const Color(0xFFC3F400)),
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final activitiesCount = _metrics?['activitiesCount'] as int? ?? 0;
    final pointsCount = _metrics?['pointsCount'] as int? ?? 0;
    final estimatedBytes = _metrics?['estimatedBytes'] as int? ?? 0;

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
          'STORAGE RETENTION MANAGER',
          style: GoogleFonts.barlowCondensed(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFC3F400),
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xFFC3F400)),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Footprint Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1D10),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF282B1D), width: 1.5),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.dns_rounded,
                          size: 40,
                          color: Color(0xFFC3F400),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'DATABASE FOOTPRINT',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF8E9379),
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _formatBytes(estimatedBytes),
                          style: GoogleFonts.barlowCondensed(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(color: Color(0xFF282B1D)),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'SESSIONS',
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 10,
                                    color: const Color(0xFF8E9379),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '$activitiesCount',
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'RAW POINTS',
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 10,
                                    color: const Color(0xFF8E9379),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '$pointsCount',
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFC3F400),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Fidelity Tuning Section
                  Text(
                    'RDP COMPRESSION FIDELITY (EPSILON)',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF8E9379),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
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
                              'Perpendicular Threshold',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                            Text(
                              '${_epsilon.toStringAsFixed(1)}m',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFC3F400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: const Color(0xFFC3F400),
                            inactiveTrackColor: const Color(0xFF282B1D),
                            thumbColor: const Color(0xFFC3F400),
                            overlayColor: const Color(0xFFC3F400).withValues(alpha: 0.15),
                          ),
                          child: Slider(
                            value: _epsilon,
                            min: 2.0,
                            max: 15.0,
                            divisions: 13,
                            onChanged: _isProcessing
                                ? null
                                : (val) {
                                    setState(() {
                                      _epsilon = val;
                                    });
                                  },
                          ),
                        ),
                        Text(
                          _epsilon <= 3.0
                              ? 'Ultra Precision: Retains subtle line variations'
                              : _epsilon <= 7.0
                                  ? 'Balanced Running Fidelity: Drops flat strides, keeps turns'
                                  : 'Aggressive Space Reduction: Retains macro turns only',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: const Color(0xFF8E9379),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Actions
                  if (_isProcessing)
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const CircularProgressIndicator(color: Color(0xFFC3F400)),
                          const SizedBox(height: 12),
                          Text(
                            'Applying RDP vector line simplification...',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color(0xFF8E9379),
                            ),
                          ),
                        ],
                      ),
                    )
                  else ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC3F400),
                          foregroundColor: const Color(0xFF111508),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.compress_rounded, size: 20),
                        label: Text(
                          'EXECUTE 90-DAY RETENTION POLICY',
                          style: GoogleFonts.barlowCondensed(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        onPressed: () => _executeCompression(simulateAll: false),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFE2E4CF),
                          side: const BorderSide(color: Color(0xFF282B1D)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.bug_report_rounded, size: 18, color: Color(0xFF8E9379)),
                        label: Text(
                          'SIMULATE POLICY OVER ENTIRE DATABASE',
                          style: GoogleFonts.barlowCondensed(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        onPressed: () => _executeCompression(simulateAll: true),
                      ),
                    ),
                  ],

                  if (_lastReclaimedCount != null) ...[
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1D10),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF282B1D)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline, color: Color(0xFFC3F400), size: 16),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Last routine cleaned $_lastReclaimedCount rows successfully.',
                              style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFFE2E4CF)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
    );
  }
}
