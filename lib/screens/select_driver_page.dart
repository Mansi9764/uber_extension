import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'booking_confirmation_page.dart'; // Import the new page

class SelectDriverPage extends StatelessWidget {
  final String carName;
  final String startDate;
  final String endDate;
  final double carPrice;

  SelectDriverPage({
    required this.carName,
    required this.startDate,
    required this.endDate,
    required this.carPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Select Driver',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Car: $carName',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
            ),
            Text(
              'Car Price: \$$carPrice per day',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Booking Dates',
              style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Start Date: $startDate',
              style: GoogleFonts.lato(fontSize: 16, color: Colors.white70),
            ),
            Text(
              'End Date: $endDate',
              style: GoogleFonts.lato(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 40),
            Text(
              'Select Driver',
              style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildDriverItem(context, 'John Doe', 5, 4.9, 1000, 2.5),
                  _buildDriverItem(context, 'Jane Smith', 3, 4.8, 850, 2.8),
                  _buildDriverItem(context, 'Robert Brown', 7, 4.7, 1200, 3.0),
                  _buildDriverItem(context, 'Michael Johnson', 4, 4.8, 900, 2.7),
                  _buildDriverItem(context, 'Emily Davis', 6, 4.9, 1100, 2.6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverItem(BuildContext context, String driverName, int experience, double rating, int milesDriven, double pricePerMile) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        title: Text(driverName, style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Experience: $experience years', style: TextStyle(color: Colors.white70)),
            Row(
              children: [
                _buildRatingStars(rating),
                SizedBox(width: 5),
                Text('$rating', style: TextStyle(color: Colors.white70)),
              ],
            ),
            Text('Miles Driven: $milesDriven', style: TextStyle(color: Colors.white70)),
            Text('Price per Mile: \$$pricePerMile', style: TextStyle(color: Colors.white70)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {
          // Navigator.push(
          //   context,
          //   // MaterialPageRoute(
          //   //   builder: (context) => BookingConfirmationPage(
          //   //     carName: carName,
          //   //     carPrice: carPrice,
          //   //     startDate: startDate,
          //   //     endDate: endDate,
          //   //     driverName: driverName,
          //   //     driverExperience: experience,
          //   //     driverRating: rating,
          //   //     driverMilesDriven: milesDriven,
          //   //     driverPricePerMile: pricePerMile,
          //     ),
          //   ),
          // );
        },
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    int halfStars = (rating - fullStars >= 0.5) ? 1 : 0;
    int emptyStars = 5 - fullStars - halfStars;

    return Row(
      children: List.generate(
        fullStars,
        (index) => Icon(Icons.star, color: Colors.yellow, size: 16),
      )..addAll(
          List.generate(
            halfStars,
            (index) => Icon(Icons.star_half, color: Colors.yellow, size: 16),
          ),
        )..addAll(
          List.generate(
            emptyStars,
            (index) => Icon(Icons.star_border, color: Colors.yellow, size: 16),
          ),
        ),
    );
  }
}
