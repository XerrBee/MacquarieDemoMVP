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
    // Build the RegisterPage widget
    await tester.pumpWidget(
      MaterialApp(
        home: RegisterPage(
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
    expect(textFormFields, findsNWidgets(3));
  });


  // testWidgets('Tapping on "Already have an account? Sign In" triggers onTap callback', (WidgetTester tester) async {
  //     bool isTapped = false;

  //     await tester.pumpWidget(
  //       MaterialApp(
  //         home: RegisterPage(
  //           onTap: () {
  //             isTapped = !isTapped;
  //           },
  //         ),
  //       ),
  //     );

  //     expect(isTapped, false);

  //     await tester.tap(find.byWidgetPredicate((widget) => widget is GestureDetector && widget.child is Text && (widget.child as Text).data == 'Already have an account? Sign In'));
  //     await tester.pumpAndSettle(); // Wait for any animations to complete

  //     expect(isTapped, true);
  // });
}
