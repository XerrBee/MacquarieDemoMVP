import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../screens/home_screen.dart';


void main() {
  testWidgets('HomePage renders without error', (WidgetTester tester) async {
    // Build the HomePage widget
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );

    // Verify that the widget renders without throwing any errors
    expect(tester.takeException(), isNull);
  });
}
