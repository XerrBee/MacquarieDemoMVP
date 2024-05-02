import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override 
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Home"),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[              
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 300,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 243, 243), // Background color
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 20), // Adjust the width as needed for spacing between the icon and text field
                      const Icon(Icons.search, color: Colors.grey), // Magnifying glass icon
                      const SizedBox(width: 10), // Adjust the width as needed for spacing between the icon and text field
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Search for...',
                            contentPadding: EdgeInsets.only(left: 10, top: 14, bottom: 14), // Adjust padding to vertically center text
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 34.0),

              GestureDetector(
                onTap: () {
                  // Navigate to coffee page
                  Navigator.pushNamed(context, '/coffee');
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
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://media.istockphoto.com/id/1158013558/photo/cup-of-coffee-with-flowing-milk-on-wooden-background-overhead-shot.jpg?s=612x612&w=0&k=20&c=Eb5FAJtL1wT9Ong_kPDfL089MAbM7BJySpJfL8Kv978=',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Text
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: const Center(
                            child: Text(
                              'Coffee', // Replace 'Category' with your actual category text
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 34.0),
              
              GestureDetector(
                onTap: () {
                  // Navigate to the Study Space Page
                  Navigator.pushNamed(context, '/studyspace');
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
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://students.mq.edu.au/__data/assets/image/0009/1175796/1cc-study-space-pink-lounge-900x600.jpg',
                              ), // Provide your image URL here
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Text
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: const Center(
                            child: Text(
                              'Study Space',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 34.0),
              GestureDetector(
                onTap: () {
                  // Navigate to the Car Park Page
                  Navigator.pushNamed(context, '/carpark');
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
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDOAoheWgNDU2X_BFypbUqrNhmPD0m72Qifh6JVi8b0g&s',
                              ), // Provide your image URL here
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Text
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: const Center(
                            child: Text(
                              'Car Park', // Replace 'Category' with your actual category text
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 34.0),
              
              GestureDetector(
                onTap: () {
                  // Navigate to the AskMQ page
                  Navigator.pushNamed(context, '/askmq');
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
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.shiksha.com/mediadata/images/1647317902phpCxEo6V.jpeg',
                              ), // Provide your image URL here
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Text
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: const Center(
                            child: Text(
                              'AskMQ', // Replace 'Category' with your actual category text
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 34.0),
              
              GestureDetector(
                onTap: () {
                  // Navigate to the Messaging Page
                  Navigator.pushNamed(context, '/message');
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
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://play-lh.googleusercontent.com/c5HiVEILwq4DqYILPwcDUhRCxId_R53HqV_6rwgJPC0j44IaVlvwASCi23vGQh5G3LIZ',
                              ), // Provide your image URL here
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Text
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: const Center(
                            child: Text(
                              'Messaging App', // Replace 'Category' with your actual category text
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 30.0),
              
              // Add Continue with Google here
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}