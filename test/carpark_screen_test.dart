
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
}
