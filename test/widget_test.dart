import 'package:flutter_test/flutter_test.dart';
import 'package:stravving/main.dart';
import 'package:provider/provider.dart';
import 'package:stravving/services/tracking_service.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('App root widget verification', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => TrackingService())],
        child: const StarvvingApp(),
      ),
    );
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
