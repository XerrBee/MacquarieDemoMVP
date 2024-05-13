import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:comp3130/theme/theme_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override 
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool _isDarkMode;
  final user = FirebaseAuth.instance.currentUser != null ? FirebaseAuth.instance.currentUser! : null;

  @override 
  void initState() {
    super.initState();
    // Initialize _isDarkMode with the current value from the ThemeProvider
    _isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Profile"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Theme.of(context).colorScheme.primary),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      body: SingleChildScrollView(
        child: Consumer<ThemeProvider>( // Use Consumer widget to access the provider
          builder: (BuildContext context, ThemeProvider themeProvider, Widget? child) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  // User Profile Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/mock_image.jpg'),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            user?.displayName ?? 'User',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                          ),
                          SizedBox(height: 5),
                          Text(
                            user?.email ?? '',
                            style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  // Profile Actions
                  ListTile(
                    leading: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary),
                    title: Text('Edit Profile', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary)),
                    onTap: () {
                      // Handle edit profile action
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
                    title: Text('Settings', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary)),
                    onTap: () {
                      // Handle settings action
                    },
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Dark Mode',
                        style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary),
                      ),
                      CupertinoSwitch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          themeProvider.toggleTheme();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
