
import 'package:comp3130/screens/carpark_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarParkPage Build Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CarParkPage(),
    ));

    final mapWidget = find.byKey(Key('map_widget'));
    expect(mapWidget, findsOneWidget);

  });

  testWidgets('CarParkPage FAQ Section Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CarParkPage(),
    ));

    // Check the presence of FAQ section title
    final faqTitle = find.text('FAQ');
    expect(faqTitle, findsOneWidget);

    // Check the presence of FAQ section content
    final faqContent = find.text('How do I reserve a parking spot?');
    expect(faqContent, findsOneWidget);
  });
}
