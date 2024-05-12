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

}
