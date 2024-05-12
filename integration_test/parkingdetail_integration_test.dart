import 'package:comp3130/screens/parkingdetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

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

    // Tap the button
    await tester.tap(find.text('Book this slot'));
    
    // Wait for the widget to rebuild after tapping the button
    await tester.pump(Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Wait for the snackbar to appear
    

    // Verify that the snackbar is displayed
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
