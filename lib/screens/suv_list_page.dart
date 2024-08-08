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
            _buildCarItem(context, 'Toyota Highlander', '5 seats, Automatic, Air Conditioning', 70.0),
            _buildCarItem(context, 'Ford Explorer', '7 seats, Automatic, Air Conditioning', 75.0),
            _buildCarItem(context, 'Honda Pilot', '8 seats, Automatic, Air Conditioning', 80.0),
            _buildCarItem(context, 'Chevrolet Tahoe', '7 seats, Automatic, Air Conditioning', 85.0),
            _buildCarItem(context, 'Nissan Pathfinder', '7 seats, Automatic, Air Conditioning', 78.0),
          ],
        ),
      ),
    );
  }

  Widget _buildCarItem(BuildContext context, String carName, String description, double price) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        title: Text(carName, style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
        subtitle: Text('$description\n\$$price per day', style: TextStyle(color: Colors.white70)),
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
}
