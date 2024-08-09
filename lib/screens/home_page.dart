import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/cars_rental_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'CarMate',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey[800]),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  labelText: 'Where to?',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Suggestions', style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800])),
                  TextButton(
                    onPressed: () {},
                    child: Text('See All', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSuggestionItem(context, Icons.directions_car, 'Ride'),
                  _buildSuggestionItem(context, Icons.car_rental, 'Rentals'),
                  _buildSuggestionItem(context, Icons.airport_shuttle, 'Intercity'),
                  _buildSuggestionItem(context, Icons.event, 'Reserve'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.local_offer, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'You have multiple promos available!',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Ride as you like it', style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800])),
            ),
            _buildRideOption(context, 'Book Your Own Car', 'assets/ride_with_uber.jpg', 'assets/ride_with_uber2.jpg', 'Everyday commute made easy.'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle tab changes
        },
        selectedItemColor: Colors.black, // Dark color for selected item
        unselectedItemColor: Colors.grey[600], // Light grey for unselected items
        showUnselectedLabels: true, // Show labels for unselected items
        type: BottomNavigationBarType.fixed, // Ensures all items are shown
      ),
    );
  }

  Widget _buildSuggestionItem(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        if (title == 'Rentals') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarRentalHomePage()), // Redirect to Book Car page
          );
        }
      },
      child: Column(
        children: [
          Container(
            width: 50, // Set width for square shape
            height: 50, // Set height for square shape
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10), // Optional: slightly rounded corners
            ),
            child: Icon(icon, size: 30, color: Colors.grey[800]),
          ),
          SizedBox(height: 8),
          Text(title, style: GoogleFonts.lato(fontSize: 16, color: Colors.grey[800])),
        ],
      ),
    );
  }

  Widget _buildRideOption(BuildContext context, String title, String assetPath1, String assetPath2, String description) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          // Handle navigation or action
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the row
              children: [
                Expanded(
                  child: Image.asset(assetPath1, height: 120, fit: BoxFit.cover), // First image
                ),
                SizedBox(width: 8), // Space between images
                Expanded(
                  child: Image.asset(assetPath2, height: 120, fit: BoxFit.cover), // Second image
                ),
              ],
            ),
            SizedBox(height: 20), // Space between images and text
            Text(
              title,
              style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
