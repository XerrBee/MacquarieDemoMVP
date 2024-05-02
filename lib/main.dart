import 'package:comp3130/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'package:comp3130/theme/theme_provider.dart';

import 'screens/profile_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MQ App',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const LoginPage(),
      routes: {
        '/home': (context) => const HomePage(),
        // '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage()
      }
    );
  }
}
