import 'package:comp3130/screens/shoppingcart_screen.dart';
import 'package:comp3130/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth_screen.dart';
import 'screens/carpark_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'package:comp3130/theme/theme_provider.dart';
import 'screens/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/register_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      debugShowCheckedModeBanner: false,
      title: 'MQ App',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: AuthPage(),
      routes: {
        // '/login': (context) => LoginPage(onTap: () {  },),
        '/home': (context) => const HomePage(),
        // '/register': (context) => RegisterPage(onTap: () {  },),
        '/profile': (context) => const ProfilePage(),
        '/carpark': (context) => const CarParkPage(),
        '/shoppingcart': (context) => ShoppingCartPage(),
      }
    );
  }
}
