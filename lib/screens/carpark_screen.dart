import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comp3130/components/parkingslot_card.dart';
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
                  // Possibly add a map functionality.
                },
                child: Container(
                  key: Key('map_widget'),
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
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: 313,
                          height: 90, 
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
                  fontSize: 30,
                  fontWeight: FontWeight.bold, 
                  color: Theme.of(context).colorScheme.primary, 
                ),
              ),
              Container(
                height: 260, 
                color: Theme.of(context).colorScheme.background, // Set the background color
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10.0), // Add padding
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ParkingSlot(
                      title: 'Central Courtyard',
                      description: 'Good park',
                      imagePath: 'assets/mqparking.jpg',
                      price: '8',
                      ratings: 4.5,
                    ),
                    SizedBox(width: 10.0,),
                    ParkingSlot(
                      title: 'Another Parking Slot',
                      description: 'Hi World',
                      imagePath: 'assets/mqparking.jpg',
                      price: '10',
                      ratings: 4.2,
                    ),
                    SizedBox(width: 10.0,),
                    ParkingSlot(
                      title: 'Another Good Slot',
                      description: 'Bye World',
                      imagePath: 'assets/mqparking.jpg',
                      price: '13',
                      ratings: 4.9,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'FAQ',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How do I reserve a parking spot?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'To reserve a parking spot, simply navigate to the parking slot you want to reserve and follow the instructions provided.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What payment methods do you accept?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'We accept various payment methods including credit/debit cards, mobile wallets, and online payment platforms.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
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
