import 'package:comp3130/screens/profile_screen.dart';
import 'package:comp3130/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'mock.dart';

class ProfilePageNotifier extends ChangeNotifier {}

void main() {
  setupFirebaseAuthMocks();
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  testWidgets('ProfilePage Text Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider(),
          ),
          ChangeNotifierProvider<ProfilePageNotifier>(
            create: (_) => ProfilePageNotifier(),
          ),
        ],
        child: MaterialApp(
          home: const ProfilePage(),
        ),
      ),
    );

    expect(find.text('Profile'), findsNWidgets(2));
  });

  testWidgets('ProfilePage Icon and Switch Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider(),
          ),
          ChangeNotifierProvider<ProfilePageNotifier>(
            create: (_) => ProfilePageNotifier(),
          ),
        ],
        child: MaterialApp(
          home: const ProfilePage(),
        ),
      ),
    );

    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
    expect(find.byType(CupertinoSwitch), findsOneWidget);
  });
}
