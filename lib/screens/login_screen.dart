import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    // Navigator.pushNamed(context, '/home');
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override 
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Center(
                  child: Text(
                  'Login',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0), // Add margin around the text
                  child: Text(
                    'Enter your email address',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16.43,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 352,
                  height: 56.32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: '',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0), // Add margin around the text
                  child: Text(
                    'Enter your password',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16.43,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 352,
                  height: 56.32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: '**************',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigate to forgot password screen
                  },
                  child: const Text(
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
                  onPressed: () => signIn(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.6),
                    ),
                    minimumSize: const Size(352, 56.32),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to Sign up/Register screen
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    'First time here? Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.43,
                    ),
                  ),
                ),
              ),
              const Center(
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
                    minimumSize: const Size(352, 56.32),
                    shadowColor: Colors.grey.withOpacity(0.5),
                    elevation: 1,
                  ),
                  child: const Text(
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