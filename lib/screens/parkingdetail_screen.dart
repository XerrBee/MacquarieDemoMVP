import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/bottom_navigation.dart';

class ParkingSlotDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final double ratings;

  const ParkingSlotDetailScreen({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.ratings,
  });

  Future<void> _bookSlot(BuildContext context) async {
    // Save data to local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> bookedSlotsJson = prefs.getStringList('bookedSlots') ?? [];
    Map<String, dynamic> slotDetails = {
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'ratings': ratings,
    };
    bookedSlotsJson.add(json.encode(slotDetails));

    prefs.setStringList('bookedSlots', bookedSlotsJson);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Slot booked')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: \$ $price',
                    style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 8),
                      Text(
                        '$ratings',
                        style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _bookSlot(context),
                    child: Text('Book this slot'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
