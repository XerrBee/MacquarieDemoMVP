import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            elevation: 0,
            onTap: (index) {
              // Navigate to different screens based on the tapped index
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/shoppingcart');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/profile');
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ].map((item) {
              return BottomNavigationBarItem(
                icon: Theme(
                  data: Theme.of(context).copyWith(
                    iconTheme: IconThemeData(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  child: item.icon,
                ),
                label: item.label,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
