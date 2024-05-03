import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottom_navigation.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String route;

  const CategoryCard({
    required this.title,
    required this.imageUrl,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: 356,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFF5F5F5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
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
                width: 100, // Adjust the width of the image container
                height: 90, // Adjust the height of the image container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
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
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}