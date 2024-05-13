import 'package:comp3130/screens/login_screen.dart';
import 'package:comp3130/screens/register_screen.dart';
import 'package:flutter/material.dart';

abstract class PageToggler {
  void togglePages();
}

// Implement the logic in a separate class
class PageTogglerImpl implements PageToggler {
  bool _showLoginPage = true;

  bool get showLoginPage => _showLoginPage;

  @override
  void togglePages() {
    _showLoginPage = !_showLoginPage;
  }
}

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}