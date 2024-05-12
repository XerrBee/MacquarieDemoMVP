import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:comp3130/screens/parkingdetail_screen.dart';

void main() {
  testWidgets('Parking Slot Detail Screen - Widget Elements Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ParkingSlotDetailScreen(
          title: 'Sample Parking',
          description: 'This is a sample parking slot.',
          price: '10',
          imagePath: 'assets/mock_image.jpg',
          ratings: 4.5,
        ),
      ),
    );

    expect(find.text('Sample Parking'), findsNWidgets(2));
    expect(find.text('\$ 10'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.text('Book this slot'), findsOneWidget);
  });

  testWidgets('Parking Slot Detail Screen - Button Functionality Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ParkingSlotDetailScreen(
          title: 'Sample Parking',
          description: 'This is a sample parking slot.',
          price: '10',
          imagePath: 'assets/mock_image.jpg',
          ratings: 4.5,
        ),
      ),
    );

    await tester.tap(find.text('Book this slot'));
    await tester.pump(Duration(seconds: 2));

    // Wait for the snackbar to appear
    await tester.runAsync(() async {
      await tester.pump(Duration(seconds: 1)); // Adjust duration as needed
      expect(find.text('Slot booked for 1 hours.'), findsOneWidget);
    });
  });
}
