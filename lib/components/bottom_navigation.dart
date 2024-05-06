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
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(20), 
          //   topRight: Radius.circular(20), 
          // ),
        ),
        child: ClipRRect(
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(20), 
          //   topRight: Radius.circular(20), 
          // ),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.surface, // Set the background color of the bar
            elevation: 0, // No elevation for the bar itself
            onTap: (index) {
              // Navigate to different screens based on the tapped index
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/notifications');
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
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.search),
              //   label: '',
              // ),
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
                    iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary), // Set icon color to black
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

