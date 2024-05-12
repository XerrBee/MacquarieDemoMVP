import 'package:comp3130/screens/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock.dart'; 

void main() {
  setupFirebaseAuthMocks(); 
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }); 
  testWidgets('ProfilePage Build Test', (WidgetTester tester) async {
    
    await tester.pumpWidget(MaterialApp(
      home: ProfilePage(),
    ));

    expect(find.text('Profile'), findsNothing);
    // expect(find.byIcon(Icons.edit), findsOneWidget);
    // expect(find.byIcon(Icons.settings), findsOneWidget);
    // expect(find.byType(CupertinoSwitch), findsOneWidget);
  });
}
