import 'package:comp3130/components/category_card.dart';
import 'package:comp3130/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';// Replace with the correct import path

void main() {
  group('HomePage Widget Tests', () {
    testWidgets('HomePage Build Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('AppBar Title Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
      expect(find.text('Home'), findsNWidgets(2)); // Two because of the bottomnavbar as well.
    });

    testWidgets('Search Field Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('Category Cards Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
      expect(find.byType(CategoryCard), findsNWidgets(5));
    });

    testWidgets('Logout Button Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
      expect(find.byIcon(Icons.logout), findsOneWidget);
    });

    testWidgets('Sign out Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomePage(),
      ));
      // You need to implement a way to sign out the user and verify if the user is signed out
    });
  });
}
