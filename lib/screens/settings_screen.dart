import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../services/database_service.dart';
import '../services/settings_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final DatabaseService _dbService = DatabaseService();
  Map<String, dynamic>? _storageMetrics;
  bool _isLoadingStorage = true;
  bool _isFlushingCache = false;
  int? _lastReclaimedCount;

  @override
  void initState() {
    super.initState();
    _fetchStorageFootprint();
  }

  Future<void> _fetchStorageFootprint() async {
    setState(() {
      _isLoadingStorage = true;
    });
    final metrics = await _dbService.getStorageMetrics();
    if (mounted) {
      setState(() {
        _storageMetrics = metrics;
        _isLoadingStorage = false;
      });
    }
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Future<void> _handleFlushCache() async {
    setState(() {
      _isFlushingCache = true;
      _lastReclaimedCount = null;
    });

    // Run batch retention policy over sequences older than 90 days
    final reclaimed = await _dbService.applyStorageRetentionPolicy(
      const Duration(days: 90),
      5.0, // 5 meters epsilon compression
    );

    await _fetchStorageFootprint();

    if (mounted) {
      setState(() {
        _isFlushingCache = false;
        _lastReclaimedCount = reclaimed;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            reclaimed > 0
                ? 'Flushed $reclaimed redundant coordinate vectors.'
                : 'Local cache optimal. No stale telemetry found.',
            style: GoogleFonts.jetBrainsMono(fontSize: 12),
          ),
          backgroundColor: const Color(0xFF282B1D),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> _confirmDestroyData() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1D10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFF93000A)),
        ),
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Color(0xFFFFB4AB)),
            const SizedBox(width: 8),
            Text(
              'DANGER ZONE',
              style: GoogleFonts.barlowCondensed(
                color: const Color(0xFFFFB4AB),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          'This initiates total destruction of locally accumulated vectors, lap records, and tracking history. This operation bypasses cloud redundancy protocols and cannot be undone.',
          style: GoogleFonts.inter(
            color: const Color(0xFFE2E4CF),
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'ABORT',
              style: GoogleFonts.jetBrainsMono(
                color: const Color(0xFF8E9379),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF93000A),
              foregroundColor: const Color(0xFFFFDAD6),
              elevation: 0,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'CONFIRM PURGE',
              style: GoogleFonts.jetBrainsMono(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _dbService.destroyAllLocalData();
      await _fetchStorageFootprint();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Local rows completely expunged.',
              style: GoogleFonts.jetBrainsMono(fontSize: 12),
            ),
            backgroundColor: const Color(0xFF93000A),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();

    return Scaffold(
      backgroundColor: const Color(0xFF111508),
      body: settings.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Page Header Section
                  Text(
                    'SETTINGS',
                    style: GoogleFonts.barlowCondensed(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFE2E4CF),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'System Configuration v2.0.4',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF8E9379),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Theme & Branding Panel
                  _buildSectionCard(
                    icon: Icons.palette_outlined,
                    title: 'THEME & BRANDING',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ACCENT COLOR',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 11,
                            color: const Color(0xFF8E9379),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildBrandingOption(
                                label: 'Neon Lime',
                                colorKey: 'lime',
                                targetColor: const Color(0xFFC3F400),
                                activeColor: settings.accentColor,
                                onSelect: () => settings.setAccentColor('lime'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _buildBrandingOption(
                                label: 'Action Orange',
                                colorKey: 'orange',
                                targetColor: const Color(0xFFFF5722),
                                activeColor: settings.accentColor,
                                onSelect: () =>
                                    settings.setAccentColor('orange'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _buildBrandingOption(
                                label: 'Crimson',
                                colorKey: 'crimson',
                                targetColor: const Color(0xFFE91E63),
                                activeColor: settings.accentColor,
                                onSelect: () =>
                                    settings.setAccentColor('crimson'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Account Integration Subsystem
                  _buildSectionCard(
                    icon: Icons.account_circle_outlined,
                    title: 'ACCOUNT',
                    child: Column(
                      children: [
                        _buildAccountConnectionRow(
                          icon: Icons.bolt_rounded,
                          iconColor: const Color(0xFFFC4C02),
                          title: 'Strava Sync',
                          subtitle: 'Connected: @athlete_prime',
                          badgeLabel: 'ACTIVE',
                          badgeBg: const Color(0xFFC3F400),
                          badgeFg: const Color(0xFF283500),
                        ),
                        const SizedBox(height: 8),
                        _buildAccountConnectionRow(
                          icon: Icons.cloud_done_outlined,
                          iconColor: settings.activeAccentColor,
                          title: 'Supabase Cloud',
                          subtitle: 'Realtime Engine Enabled',
                          badgeLabel: 'SYNCED',
                          badgeBg: const Color(0xFF282B1D),
                          badgeFg: const Color(0xFFE2E4CF),
                          showIndicatorDot: true,
                          dotColor: settings.activeAccentColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // App Preferences Panel
                  _buildSectionCard(
                    icon: Icons.tune_rounded,
                    title: 'APP PREFERENCES',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MEASUREMENT UNITS',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 11,
                            color: const Color(0xFF8E9379),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF282B1D),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xFF444933)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildSwitcherTab(
                                  label: 'METRIC',
                                  isActive: settings.units == 'metric',
                                  activeBg: settings.activeAccentColor,
                                  onTap: () => settings.setUnits('metric'),
                                ),
                              ),
                              Expanded(
                                child: _buildSwitcherTab(
                                  label: 'IMPERIAL',
                                  isActive: settings.units == 'imperial',
                                  activeBg: settings.activeAccentColor,
                                  onTap: () => settings.setUnits('imperial'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Cache Management Info Area
                        Divider(
                          color: const Color(0xFF444933),
                          height: 1,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CACHE MANAGEMENT',
                                    style: GoogleFonts.jetBrainsMono(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFE2E4CF),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    _isLoadingStorage
                                        ? 'Scanning local telemetry...'
                                        : 'Footprint: ${_storageMetrics != null ? _formatBytes(_storageMetrics!['estimatedBytes']) : '0 B'} (${_storageMetrics?['pointsCount'] ?? 0} vectors)',
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      color: const Color(0xFF8E9379),
                                    ),
                                  ),
                                  if (_lastReclaimedCount != null) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      'Last run reclaimed: $_lastReclaimedCount points',
                                      style: GoogleFonts.inter(
                                        fontSize: 10,
                                        color: settings.activeAccentColor,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFFFF5722),
                                side: const BorderSide(
                                  color: Color(0xFFD73B00),
                                  width: 1.5,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: _isFlushingCache
                                  ? null
                                  : _handleFlushCache,
                              child: _isFlushingCache
                                  ? const SizedBox(
                                      width: 14,
                                      height: 14,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Color(0xFFFF5722),
                                      ),
                                    )
                                  : Text(
                                      'FLUSH CACHE',
                                      style: GoogleFonts.jetBrainsMono(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Warning Protocol Section (Danger Zone)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1D10),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFF93000A)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.warning_rounded,
                              color: Color(0xFFFFB4AB),
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'WARNING PROTOCOL',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFFB4AB),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF93000A),
                              foregroundColor: const Color(0xFFFFDAD6),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: _confirmDestroyData,
                            child: Text(
                              'DESTROY LOCAL DATA',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF8E9379),
                              side: const BorderSide(
                                color: Color(0xFF444933),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Terminal disconnect hook requested.',
                                    style: GoogleFonts.jetBrainsMono(
                                      fontSize: 12,
                                    ),
                                  ),
                                  backgroundColor: const Color(0xFF282B1D),
                                ),
                              );
                            },
                            child: Text(
                              'SIGN OUT OF TERMINAL',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildSectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2113),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF444933)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: const Color(0xFFC3F400)),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFE2E4CF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildBrandingOption({
    required String label,
    required String colorKey,
    required Color targetColor,
    required String activeColor,
    required VoidCallback onSelect,
  }) {
    final isSelected = colorKey == activeColor;
    return GestureDetector(
      onTap: onSelect,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                color: isSelected
                    ? targetColor.withValues(alpha: 0.2)
                    : const Color(0xFF111508),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? targetColor : const Color(0xFF444933),
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: targetColor.withValues(alpha: 0.3),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ]
                    : null,
              ),
              child: isSelected
                  ? Icon(Icons.check_rounded, color: targetColor, size: 20)
                  : null,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label.toUpperCase(),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? targetColor : const Color(0xFF8E9379),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountConnectionRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String badgeLabel,
    required Color badgeBg,
    required Color badgeFg,
    bool showIndicatorDot = false,
    Color? dotColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D10),
        border: Border.all(color: const Color(0xFF444933)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE2E4CF),
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: const Color(0xFF8E9379),
                  ),
                ),
              ],
            ),
          ),
          if (showIndicatorDot && dotColor != null) ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: dotColor.withValues(alpha: 0.6),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
          ],
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: badgeBg,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              badgeLabel,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: badgeFg,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitcherTab({
    required String label,
    required bool isActive,
    required Color activeBg,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? activeBg.withValues(alpha: 0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(2),
          border: isActive
              ? Border.all(color: activeBg.withValues(alpha: 0.5))
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? activeBg : const Color(0xFF8E9379),
          ),
        ),
      ),
    );
  }
}
