import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override 
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0),
              const Center(
                  child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20.0),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 30.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigate to forgot password screen
                  },
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.43,
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home'); // Navigate to '/home' route
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.6),
                    ),
                    minimumSize: Size(352, 56.32),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to Sign up/Register screen
                  },
                  child: Text(
                    'First time here? Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.43,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'or',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.43,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home'); // Navigate to '/home' route
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.6),
                      side: BorderSide(color: Colors.grey.withOpacity(0.5), width: 2), // Add border
                    ),
                    minimumSize: Size(352, 56.32),
                    shadowColor: Colors.grey.withOpacity(0.5),
                    elevation: 1,
                  ),
                  child: Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              // Add Continue with Google here
            ],
          ),
        ),
      ),
    );
  }
}