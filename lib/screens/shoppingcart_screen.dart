import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Map<String, dynamic>> bookedSlots = [];

  @override
  void initState() {
    super.initState();
    // Retrieve data from local storage
    _loadData();
  }

  Future<void> _loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? bookedSlotsJson = prefs.getStringList('bookedSlots');
    if (bookedSlotsJson != null) {
      setState(() {
        bookedSlots = bookedSlotsJson.map((slotJson) => Map<String, dynamic>.from(json.decode(slotJson))).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (bookedSlots.isNotEmpty)
              Column(
                children: bookedSlots.map((slot) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: ${slot['title']}',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Description: ${slot['description']}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Price: ${slot['price']}',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        // Display other details as needed
                        // You can also display the image here
                      ],
                    ),
                  );
                }).toList(),
              ),
            if (bookedSlots.isEmpty)
              Center(
                child: Text(
                  'No items in the shopping cart',
                  style: TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
