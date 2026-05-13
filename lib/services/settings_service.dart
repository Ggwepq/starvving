import 'package:flutter/material.dart';
import '../models/schemas.dart';
import 'database_service.dart';

class SettingsService extends ChangeNotifier {
  AppSettings _settings = AppSettings();
  bool _isLoading = true;
  bool _isOfflineMode = true;

  bool get isLoading => _isLoading;
  String get accentColor => _settings.accentColor;
  String get units => _settings.units;
  double get monthlyGoalKm => _settings.monthlyGoalKm;
  String? get stravaAccessToken => _settings.stravaAccessToken;
  bool get isOfflineMode => _isOfflineMode;

  // Derive dynamic theme coloring mappings based on branding selection
  Color get activeAccentColor {
    switch (_settings.accentColor) {
      case 'orange':
        return const Color(0xFFFF5722); // Action Orange
      case 'crimson':
        return const Color(0xFFE91E63); // Performance Crimson
      case 'lime':
      default:
        return const Color(0xFFC3F400); // Neon Lime
    }
  }

  String get accentColorHex {
    switch (_settings.accentColor) {
      case 'orange':
        return '#FF5722';
      case 'crimson':
        return '#E91E63';
      case 'lime':
      default:
        return '#C3F400';
    }
  }

  // Derive contextual unit display suffixes
  String get unitSuffix => units == 'imperial' ? 'mi' : 'km';
  String get speedUnitSuffix => units == 'imperial' ? 'mph' : 'km/h';
  String get paceUnitSuffix => units == 'imperial' ? '/mi' : '/km';
  String get elevationUnitSuffix => units == 'imperial' ? 'ft' : 'm';

  SettingsService() {
    loadSettings();
  }

  // Load configuration singleton from local Isar persistent database
  Future<void> loadSettings() async {
    _isLoading = true;
    notifyListeners();

    try {
      _settings = await DatabaseService().getSettings();
    } catch (e) {
      debugPrint('Error loading app settings: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Apply and persist accent color updates globally
  Future<void> setAccentColor(String color) async {
    if (_settings.accentColor == color) return;
    _settings.accentColor = color;
    notifyListeners();
    await DatabaseService().saveSettings(_settings);
  }

  // Toggle active telemetry measurement systems globally
  Future<void> setUnits(String selectedUnits) async {
    if (_settings.units == selectedUnits) return;
    _settings.units = selectedUnits;
    notifyListeners();
    await DatabaseService().saveSettings(_settings);
  }

  // Update monthly goal configurations
  Future<void> setMonthlyGoalKm(double goal) async {
    if (_settings.monthlyGoalKm == goal) return;
    _settings.monthlyGoalKm = goal;
    notifyListeners();
    await DatabaseService().saveSettings(_settings);
  }

  // Toggle offline cache routing state
  Future<void> setOfflineMode(bool offline) async {
    if (_isOfflineMode == offline) return;
    _isOfflineMode = offline;
    notifyListeners();
  }

  // Distance Conversion Helpers (Meters -> Target Unit Length)
  double convertDistance(double distanceMeters) {
    final km = distanceMeters / 1000.0;
    return units == 'imperial' ? km * 0.621371 : km;
  }

  String formatDistanceStr(double distanceMeters, {int decimals = 2}) {
    return convertDistance(distanceMeters).toStringAsFixed(decimals);
  }

  // Elevation Conversion Helpers (Meters -> Target Unit Height)
  double convertElevation(double elevationMeters) {
    return units == 'imperial' ? elevationMeters * 3.28084 : elevationMeters;
  }

  String formatElevationStr(double elevationMeters, {int decimals = 0}) {
    return convertElevation(elevationMeters).toStringAsFixed(decimals);
  }

  // Speed Conversion Helpers (Meters/Sec -> Target Unit Rate)
  double convertSpeed(double speedMps) {
    final kmh = speedMps * 3.6;
    return units == 'imperial' ? kmh * 0.621371 : kmh;
  }

  String formatSpeedStr(double speedMps, {int decimals = 1}) {
    return convertSpeed(speedMps).toStringAsFixed(decimals);
  }

  // Pace Conversion Helpers (Seconds/Km -> Target Unit Duration string)
  String formatPace(double avgPaceSecPerKm) {
    if (avgPaceSecPerKm <= 0 || avgPaceSecPerKm.isInfinite) {
      return '--:--';
    }

    // Convert base pace depending on target metrics
    final targetSeconds = units == 'imperial'
        ? avgPaceSecPerKm / 0.621371
        : avgPaceSecPerKm;

    final minutes = (targetSeconds / 60).floor();
    final seconds = (targetSeconds % 60).floor();
    final secStr = seconds.toString().padLeft(2, '0');

    return '$minutes:$secStr';
  }
}
