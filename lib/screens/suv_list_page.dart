import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_driver_page.dart'; // Import the new page

class SuvListPage extends StatelessWidget {
  final String startDate;
  final String endDate;

  SuvListPage({required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Available SUVs',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildCarItem(context, 'Toyota Highlander 2021', '5 seats, Automatic, Air Conditioning, Petrol', 70.0, 4.5),
            _buildCarItem(context, 'Ford Explorer 2020', '7 seats, Automatic, Air Conditioning, Diesel', 75.0, 4),
            _buildCarItem(context, 'Honda Pilot 2019', '8 seats, Automatic, Air Conditioning, Petrol', 80.0, 3),
            _buildCarItem(context, 'Chevrolet Tahoe 2021', '7 seats, Automatic, Air Conditioning, Diesel', 85.0, 2),
            _buildCarItem(context, 'Nissan Pathfinder 2018', '7 seats, Automatic, Air Conditioning, Petrol', 78.0, 4.5),
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectDriverPage(
                carName: carName,
                startDate: startDate,
                endDate: endDate,
                carPrice: price,
              ),
            ),
          );
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
