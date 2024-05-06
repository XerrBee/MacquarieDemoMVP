import 'package:comp3130/components/parkingslot_card.dart';
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
                    color: Theme.of(context).colorScheme.surface,
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
              SizedBox(height: 20.0,),
              Text(
                'Parking Slot',
                style: TextStyle(
                fontSize: 30, // Adjust the size as needed
                fontWeight: FontWeight.bold, // Make it bold
                color: Colors.black87, // Choose the color you prefer
                ),
              ),
               Container(
                height: 260, // Adjust the height as needed
                color: Colors.white, // Set the background color
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10.0), // Add padding
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ParkingSlot(
                      title: 'Central Courtyard',
                      description: 'Good park',
                      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8H0K9Jmpmgw7MfuupIMA2f3xId5s9MgZqL-CahFozXw&s',
                      route: '',
                      price: '8',
                      ratings: 4.5,
                    ),
                    SizedBox(width: 10.0,),
                    ParkingSlot(
                      title: 'Another Parking Slot',
                      description: 'Hi World',
                      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8H0K9Jmpmgw7MfuupIMA2f3xId5s9MgZqL-CahFozXw&s',
                      route: '',
                      price: '10',
                      ratings: 4.2,
                    ),
                    // Add more ParkingSlot widgets as needed
                  ],
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
