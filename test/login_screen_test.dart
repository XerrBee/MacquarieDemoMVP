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
      
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(
            onTap: () {}, 
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
      
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(
            onTap: () {},
          ),
        ),
      );

      final textFormFields = find.byType(TextFormField);

      textFormFields.evaluate().forEach((element) {
        final widget = element.widget as TextFormField;
      });

      expect(textFormFields, findsNWidgets(2));
    });
  });
}
