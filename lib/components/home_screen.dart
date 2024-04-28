import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override 
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[              
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),

              Center(
                child: Container(
                  width: 343,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F1F2), // Background color
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20), // Adjust the width as needed for spacing between the icon and text field
                      Icon(Icons.search, color: Colors.grey), // Magnifying glass icon
                      SizedBox(width: 10), // Adjust the width as needed for spacing between the icon and text field
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search for...',
                            contentPadding: EdgeInsets.only(left: 10, top: 14, bottom: 14), // Adjust padding to vertically center text
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
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
    );
  }
}