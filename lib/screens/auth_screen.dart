import 'package:comp3130/screens/home_screen.dart';
import 'package:comp3130/screens/login_or_register.dart';
import 'package:comp3130/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if user is logged in
          if(snapshot.hasData) {
            return HomePage();
          }
          // if user is not logged in
          else {
            return LoginOrRegisterPage();
          }
        }
      )
    );
  }
}