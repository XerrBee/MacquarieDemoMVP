import 'package:comp3130/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart'; 

void main() {
  testWidgets('ProfilePage Build Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ProfilePage(),
    ));

    await tester.pumpAndSettle();

    expect(find.text('Profile'), findsOneWidget);
    // expect(find.byIcon(Icons.edit), findsOneWidget);
    // expect(find.byIcon(Icons.settings), findsOneWidget);
    // expect(find.byType(CupertinoSwitch), findsOneWidget);
  });
}
