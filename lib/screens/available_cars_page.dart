import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'suv_list_page.dart'; // Import the new page

class AvailableCarsPage extends StatelessWidget {
  final String startDate;
  final String endDate;

  AvailableCarsPage({required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Available Cars',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cars available from $startDate to $endDate',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
            _buildCarOption(context, 'SUV', SuvListPage(startDate: startDate, endDate: endDate)),
            _buildCarOption(context, 'Sedan', null),
            _buildCarOption(context, 'Prime SUV', null),
          ],
        ),
      ),
    );
  }

  Widget _buildCarOption(BuildContext context, String carType, Widget? nextPage) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        title: Text(carType, style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {
          if (nextPage != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextPage),
            );
          } else {
            // Handle logic for other car types
          }
        },
      ),
    );
  }
}
