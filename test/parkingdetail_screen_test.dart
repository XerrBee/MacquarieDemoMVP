import 'package:comp3130/screens/parkingdetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Parking Slot Detail Screen Test', (WidgetTester tester) async {
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

    // // Tap on the book button and wait for the widget to rebuild.
    // await tester.tap(find.text('Book this slot'));
    // await tester.pump();

    // // Verify that the snackbar is displayed after tapping the book button.
    // expect(find.text('Slot booked for 1 hours. Total price: \$10.00'), findsOneWidget);
  });
}
