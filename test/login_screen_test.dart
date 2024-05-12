import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart'; // Import mockito

import '../lib/screens/login_screen.dart';

// Create a mock FirebaseAuth instance
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  group('LoginPage Widget Tests', () {
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
    });

    testWidgets('Initial state of LoginPage widget', (WidgetTester tester) async {
      // Pump the LoginPage widget
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(
            onTap: () {}, // Mock onTap callback
          ),
        ),
      );

      expect(find.text('Login'), findsNWidgets(2)); 

      expect(find.byType(TextFormField), findsNWidgets(2));

      expect(find.text('Forgot your password?'), findsOneWidget);

      expect(find.text('First time here? Sign Up'), findsOneWidget);

      expect(find.text('Continue with Google'), findsOneWidget);
    });

    testWidgets('RegisterPage text fields are initially empty', (WidgetTester tester) async {
      // Build the RegisterPage widget
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(
            onTap: () {}, // Provide a mock onTap callback
          ),
        ),
      );

      // Find all the text form fields
      final textFormFields = find.byType(TextFormField);

      // Print out the details of each found text form field
      textFormFields.evaluate().forEach((element) {
        final widget = element.widget as TextFormField;
        print('TextFormField found: key: ${widget.key}, controller: ${widget.controller}');
      });

      // Verify that only three text form fields are found
      expect(textFormFields, findsNWidgets(2));
    });
  });
}
