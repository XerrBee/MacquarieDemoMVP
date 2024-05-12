import 'package:flutter/material.dart';
import '../screens/parkingdetail_screen.dart';

class ParkingSlot extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imagePath;
  final double ratings;

  const ParkingSlot({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ParkingSlotDetailScreen(
              title: title,
              description: description,
              price: price,
              imagePath: imagePath, // Passing imagePath to the detail screen
              ratings: ratings,
            ),
          ),
        );
      },
      child: Container(
        width: 235,
        height: 232,
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
              height: 98,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath), 
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
                      Expanded( // Wrap the text in Expanded widget
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.text_format, color: Colors.blue),
                      SizedBox(width: 6),
                      Expanded( // Wrap the text in Expanded widget
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
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
                      SizedBox(width: 6),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
