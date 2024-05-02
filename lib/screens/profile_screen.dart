import 'package:comp3130/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/bottom_navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override 
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isDarkMode = false;

  @override 
  void initState() {
    super.initState();
    // Initialize _isDarkMode with the current value from the ThemeProvider
    _isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
  }

  @override 
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Profile"),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[              
              SizedBox(height: 30.0),
              // Add Toggle Button for Dark Mode
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 18),
                  ),
                  CupertinoSwitch(
                    value: _isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        _isDarkMode = value;
                        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                        // You can implement dark mode logic here
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
