import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../components/parkingslot_card.dart';
import '../screens/carpark_screen.dart';

void main() {
  testWidgets('CarParkPage renders without error', (WidgetTester tester) async {
    // Build the CarParkPage widget
    await tester.pumpWidget(
      MaterialApp(
        home: CarParkPage()
      ),
    );

    // Verify that the widget renders without throwing any errors
    expect(tester.takeException(), isNull);

    // Verify the presence of the app bar title
    // expect(find.text('Car Park'), findsOneWidget);

    // Verify the presence of the text 'Parking Slot'
    expect(find.text('Parking Slot'), findsOneWidget);
  });
}
