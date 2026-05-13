import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'services/database_service.dart';
import 'services/settings_service.dart';
import 'services/tracking_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.init();
  runApp(const StarvvingApp());
}

class StarvvingApp extends StatelessWidget {
  const StarvvingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsService()),
        ChangeNotifierProvider(create: (_) => TrackingService()),
      ],
      child: Consumer<SettingsService>(
        builder: (context, settings, child) {
          final primaryColor = settings.activeAccentColor;
          return MaterialApp(
            title: 'Starvving',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: const Color(0xFF111508),
              colorScheme: ColorScheme.fromSeed(
                seedColor: primaryColor,
                brightness: Brightness.dark,
                primary: primaryColor,
                surface: const Color(0xFF111508),
                onSurface: const Color(0xFFE2E4CF),
              ),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
