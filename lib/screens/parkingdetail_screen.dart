import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/bottom_navigation.dart';

class ParkingSlotDetailScreen extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String imagePath;
  final double ratings;

  const ParkingSlotDetailScreen({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.ratings,
  });

  @override
  _ParkingSlotDetailScreenState createState() => _ParkingSlotDetailScreenState();
}

class _ParkingSlotDetailScreenState extends State<ParkingSlotDetailScreen> {
  int _selectedDuration = 1; // Default duration

  double _calculateTotalPrice() {
    return double.parse(widget.price) * _selectedDuration;
  }

  Future<void> _bookSlot(BuildContext context) async {
    // Save data to local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Calculate total price based on duration
    double totalPrice = _calculateTotalPrice();

    List<String> bookedSlotsJson = prefs.getStringList('bookedSlots') ?? [];
    Map<String, dynamic> slotDetails = {
      'title': widget.title,
      'description': widget.description,
      'price': widget.price,
      'imagePath': widget.imagePath,
      'ratings': widget.ratings,
      'duration': _selectedDuration,
      'totalPrice': totalPrice, // Add total price to slot details
    };
    bookedSlotsJson.add(json.encode(slotDetails));

    prefs.setStringList('bookedSlots', bookedSlotsJson);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Slot booked for $_selectedDuration hours. Total price: \$${totalPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.white),)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        titleTextStyle: TextStyle(fontSize: 25.0,color: Theme.of(context).colorScheme.primary),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
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
              child: Image.asset(
                widget.imagePath, 
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      SizedBox(width: 8),
                      Text(
                        '${widget.ratings}',
                        style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Text(
                        '\$ ${widget.price}',
                        style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
                    style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text('Select Duration:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                      SizedBox(width: 10),
                      DropdownButton<int>(
                        value: _selectedDuration,
                        items: List.generate(
                          24, 
                          (index) => DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text('${index + 1} hour${index == 0 ? '' : 's'}', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _selectedDuration = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20, left: 20),
          child: ElevatedButton(
            onPressed: () => _bookSlot(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.6),
              ),
              minimumSize: const Size(352, 56.32),
            ),
            child: const Text(
              'Book this slot',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
