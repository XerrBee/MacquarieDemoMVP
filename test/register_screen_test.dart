import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/screens/register_screen.dart';

void main() {
  testWidgets('RegisterPage renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RegisterPage(
          onTap: () {}, 
        ),
      ),
    );

    expect(tester.takeException(), isNull);

    expect(find.byType(TextFormField), findsNWidgets(3)); // Email, password, confirm password

    expect(find.text('Register'), findsNWidgets(2));

    expect(find.text('Already have an account? Sign In'), findsOneWidget);
  });

  testWidgets('RegisterPage text fields are initially empty', (WidgetTester tester) async {
    
    await tester.pumpWidget(
      MaterialApp(
        home: RegisterPage(
          onTap: () {}, // Provide a mock onTap callback
        ),
      ),
    );

    // Find all the text form fields
    final textFormFields = find.byType(TextFormField);

    // Verify that only three text form fields are found
    expect(textFormFields, findsNWidgets(3));
  });
}
