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
                    color: Color.fromARGB(255, 245, 243, 243),
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
                            hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                            contentPadding: EdgeInsets.only(left: 10, top: 14, bottom: 14),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
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
                imageUrl:
                    'https://media.istockphoto.com/id/1158013558/photo/cup-of-coffee-with-flowing-milk-on-wooden-background-overhead-shot.jpg?s=612x612&w=0&k=20&c=Eb5FAJtL1wT9Ong_kPDfL089MAbM7BJySpJfL8Kv978=',
                route: '/coffee',
              ),
              SizedBox(height: 34.0),
              const CategoryCard(
                title: 'Study Space',
                imageUrl: 'https://students.mq.edu.au/__data/assets/image/0009/1175796/1cc-study-space-pink-lounge-900x600.jpg',
                route: '/studyspace',
              ),
              SizedBox(height: 34.0),
              const CategoryCard(
                title: 'Car Park',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDOAoheWgNDU2X_BFypbUqrNhmPD0m72Qifh6JVi8b0g&s',
                route: '/carpark',
              ),
              SizedBox(height: 34.0),
              const CategoryCard(
                title: 'AskMQ',
                imageUrl: 'https://images.shiksha.com/mediadata/images/1647317902phpCxEo6V.jpeg',
                route: '/askmq',
              ),
              SizedBox(height: 34.0),
              const CategoryCard(
                title: 'Messaging App',
                imageUrl: 'https://play-lh.googleusercontent.com/c5HiVEILwq4DqYILPwcDUhRCxId_R53HqV_6rwgJPC0j44IaVlvwASCi23vGQh5G3LIZ',
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