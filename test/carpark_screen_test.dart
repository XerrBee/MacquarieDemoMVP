
import 'package:comp3130/screens/carpark_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarParkPage Build Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CarParkPage(),
    ));

    expect(find.text('Car Park'), findsOneWidget);
    expect(find.text('Parking Slot'), findsOneWidget);
  });
}
