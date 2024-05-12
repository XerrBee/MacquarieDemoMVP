import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

import '../lib/screens/shoppingcart_screen.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('ShoppingCartPage Widget Tests', () {
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('Display "No items in the shopping cart" message when cart is empty', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ShoppingCartPage(),
      ));

      expect(find.text('No items in the shopping cart'), findsOneWidget);
    });

    testWidgets('Verify app bar title is present', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ShoppingCartPage(),
      ));

      expect(find.text('Shopping Cart'), findsOneWidget);
    });


  });
}
