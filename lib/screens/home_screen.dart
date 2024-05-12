import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottom_navigation.dart';
import '../components/category_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Home"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Theme.of(context).colorScheme.primary),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        actions: <Widget>[
          IconButton(
            onPressed: signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 300,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search for...',
                            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                            contentPadding: EdgeInsets.only(left: 10, top: 14, bottom: 14),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 34.0),
              const CategoryCard(
                title: 'Coffee',
                imagePath:
                    'assets/coffee.jpg',
                route: '/coffee',
              ),
              SizedBox(height: 34.0),
              const CategoryCard(
                title: 'Study Space',
                imagePath: 'assets/studyspace.jpg',
                route: '/studyspace',
              ),
              SizedBox(height: 34.0),
              const CategoryCard(
                title: 'Car Park',
                imagePath: 'assets/carpark.jpg',
                route: '/carpark',
              ),
              SizedBox(height: 34.0),
              const CategoryCard(
                title: 'AskMQ',
                imagePath: 'assets/askmq.jpg',
                route: '/askmq',
              ),
              SizedBox(height: 34.0),
              const CategoryCard(
                title: 'Messaging App',
                imagePath: 'assets/chat.png',
                route: '/message',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}