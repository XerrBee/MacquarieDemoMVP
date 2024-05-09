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

  void _removeItemFromCart(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bookedSlots.removeAt(index);
      prefs.setStringList('bookedSlots', bookedSlots.map((slot) => json.encode(slot)).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (bookedSlots.isNotEmpty)
              Column(
                children: bookedSlots.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final Map<String, dynamic> slot = entry.value;
                  return GestureDetector(
                    onTap: () {
                      // Do something when item is tapped
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.0),
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
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: 100,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                  image: NetworkImage(slot['imageUrl']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // Text
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${slot['title']}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '${slot['description']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '\$${slot['price']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      SizedBox(width: 4),
                                      Text(
                                        '${slot['ratings']}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).colorScheme.onSurface,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _removeItemFromCart(index),
                          ),
                        ],
                      ),
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
