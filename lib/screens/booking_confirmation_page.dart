import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingConfirmationPage extends StatelessWidget {
  final Map<String, dynamic> car;
  final Map<String, String> driverDetails;

  BookingConfirmationPage({required this.car, required this.driverDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Text(
          'Booking Confirmed',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/map.jpg"), // Specify your own background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(Icons.check_circle, color: Colors.green, size: 100), // Confirmation icon
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your booking is confirmed!',
                    style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  _buildSectionTitle('Car Details'),
                  _buildCarDetails(),
                  SizedBox(height: 20),
                  _buildSectionTitle('Driver Details'),
                  _buildDriverDetails(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget _buildCarDetails() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(car['image'], width: 100, height: 60, fit: BoxFit.cover),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(car['description'], style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: 5),
                  Text("Seats: ${car['seats']}", style: GoogleFonts.lato(fontSize: 14, color: Colors.black)),
                  Text("Luggage: ${car['luggage']}", style: GoogleFonts.lato(fontSize: 14, color: Colors.black)),
                  Text("Price: \$${car['price']}", style: GoogleFonts.lato(fontSize: 14, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverDetails() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Driver's Name: ${driverDetails['name']}", style: GoogleFonts.lato(fontSize: 16, color: Colors.black)),
            Text("Driver's License: ${driverDetails['license']}", style: GoogleFonts.lato(fontSize: 16, color: Colors.black)),
            Text("Contact Number: ${driverDetails['contact']}", style: GoogleFonts.lato(fontSize: 16, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
