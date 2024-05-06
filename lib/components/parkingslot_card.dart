import 'package:flutter/material.dart';

class ParkingSlot extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final String route;
  final double ratings;

  const ParkingSlot({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.route,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: 235,
        height: 234,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary,
              spreadRadius: 2,
              blurRadius: 9,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Title, Description, and Price
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_parking, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.text_format, color: Colors.blue),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.blue),
                      SizedBox(width: 6),
                      Text(
                        '\$$price',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 6),
                  Row(
                    children: [
                      SizedBox(width: 15.0),
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 6),
                      Text(
                        '$ratings',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              // Implement the add functionality
                            },
                            icon: Icon(Icons.add_circle, color: Colors.blue, size: 32),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
