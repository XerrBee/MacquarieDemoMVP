import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override 
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0),
              
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),

              

              SizedBox(height: 30.0),
              
              // Add Continue with Google here
            ],
          ),
        ),
      ),
    );
  }
}