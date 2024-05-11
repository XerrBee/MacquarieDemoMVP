import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../screens/register_screen.dart';

void main() {
  testWidgets('RegisterPage renders without error', (WidgetTester tester) async {
    // Build the RegisterPage widget
    await tester.pumpWidget(
      MaterialApp(
        home: RegisterPage(
          onTap: () {}, // Provide a mock onTap callback
        ),
      ),
    );

    // Verify that the widget renders without throwing any errors
    expect(tester.takeException(), isNull);

    // Verify the presence of input fields
    expect(find.byType(TextFormField), findsNWidgets(3)); // Email, password, confirm password

    // Verify the presence of the register button
    expect(find.text('Register'), findsNWidgets(2));

    // Verify the presence of the "Already have an account?" text
    expect(find.text('Already have an account? Sign In'), findsOneWidget);
  });
}
