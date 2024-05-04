import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottom_navigation.dart';
import '../components/category_card.dart';

class CarParkPage extends StatelessWidget {
  const CarParkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Car Park"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Theme.of(context).colorScheme.primary),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, route);
                },
                child: Container(
                  width: 356,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFFF5F5F5),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.secondary,
                        spreadRadius: 2,
                        blurRadius: 9,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Image with padding
                      Padding(
                        padding: EdgeInsets.all(8), // Adjust padding as needed
                        child: Container(
                          width: 313, // Adjust the width of the image container
                          height: 90, // Adjust the height of the image container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: AssetImage("assets/mq-campus-map.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Text
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}