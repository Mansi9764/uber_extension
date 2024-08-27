import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_driver_page.dart'; // Import the new page

class LuxuryListPage extends StatelessWidget {
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String pickupLocation;
  final String dropLocation;
  final int numberOfDays;

  LuxuryListPage({
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.pickupLocation,
    required this.dropLocation,
    required this.numberOfDays,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Available Luxury Cars',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildCarItem(context, 'Mercedes-Benz S-Class 2021', '5 seats, Automatic, Air Conditioning, Petrol', 150.0, 5.0),
            _buildCarItem(context, 'BMW 7 Series 2020', '5 seats, Automatic, Air Conditioning, Diesel', 140.0, 4.8),
            _buildCarItem(context, 'Audi A8 2019', '5 seats, Automatic, Air Conditioning, Petrol', 145.0, 4.9),
            _buildCarItem(context, 'Lexus LS 2021', '5 seats, Automatic, Air Conditioning, Hybrid', 160.0, 5.0),
            _buildCarItem(context, 'Jaguar XJ 2018', '5 seats, Automatic, Air Conditioning, Diesel', 130.0, 4.7),
          ],
        ),
      ),
    );
  }

  Widget _buildCarItem(BuildContext context, String carName, String description, double price, double rating) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        title: Text(carName, style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$description', style: TextStyle(color: Colors.white70)),
            Row(
              children: [
                Text('\$$price per day', style: TextStyle(color: Colors.white70)),
                SizedBox(width: 10),
                _buildRatingStars(rating),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SelectDriverPage(
          //       carName: carName,
          //       startDate: startDate,
          //       endDate: endDate,
          //       carPrice: price,
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
