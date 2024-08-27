import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_driver_page.dart'; // Import the new page

class SedanListPage extends StatelessWidget {
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String pickupLocation;
  final String dropLocation;
  final int numberOfDays;

  SedanListPage({
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
          'Available Sedans',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildCarItem(context, 'Toyota Camry 2021', '5 seats, Automatic, Air Conditioning, Petrol', 50.0, 4.7),
            _buildCarItem(context, 'Honda Accord 2020', '5 seats, Automatic, Air Conditioning, Hybrid', 55.0, 4.8),
            _buildCarItem(context, 'Nissan Altima 2019', '5 seats, Automatic, Air Conditioning, Petrol', 48.0, 4.5),
            _buildCarItem(context, 'Hyundai Sonata 2021', '5 seats, Automatic, Air Conditioning, Petrol', 52.0, 4.6),
            _buildCarItem(context, 'Ford Fusion 2018', '5 seats, Automatic, Air Conditioning, Hybrid', 47.0, 4.4),
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
