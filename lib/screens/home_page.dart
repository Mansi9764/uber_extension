import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'book_car_page.dart'; // Import the new page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Trippo', style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white54),
                  labelText: 'Pick Up Location?',
                  labelStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Suggestions', style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  TextButton(
                    onPressed: () {},
                    child: Text('See All', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSuggestionItem(Icons.directions_car, 'Ride'),
                  _buildSuggestionItem(Icons.car_rental, 'Rentals'),
                  _buildSuggestionItem(Icons.airport_shuttle, 'Intercity'),
                  _buildSuggestionItem(Icons.event, 'Reserve'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.local_offer, color: Colors.white),
                    SizedBox(width: 10),
                    Text('You have multiple promos', style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Ride as you like it', style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            _buildRideOption(context, 'Book Car', 'assets/auto.png', 'Everyday commute made easy.'),
            // _buildRideOption('Book Go', 'assets/go.png', 'Affordable car rides.'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view, color: Colors.white), label: 'Service'),
          BottomNavigationBarItem(icon: Icon(Icons.local_activity, color: Colors.white), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Colors.white), label: 'Account'),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle tab changes
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }

  Widget _buildSuggestionItem(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[850],
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(title, style: GoogleFonts.lato(fontSize: 16, color: Colors.white)),
      ],
    );
  }

  Widget _buildRideOption(BuildContext context, String title, String assetPath, String description) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookCarPage()), // Navigate to CarListingPage
          );
        },
        child: Row(
          children: [
            Image.asset(assetPath, height: 50),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
                SizedBox(height: 5),
                Text(description, style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
