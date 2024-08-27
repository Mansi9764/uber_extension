import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'luxury_list_page.dart';
import 'sedan_list_page.dart';
import 'suv_list_page.dart';

class CarTypeSelectionPage extends StatelessWidget {
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String pickupLocation;
  final String dropLocation;
  final int numberOfDays;

  CarTypeSelectionPage({
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
        title: Text(
          'Select Car Type',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildCarTypeOption(context, 'Sedan', _navigateToSedanListPage, Icons.directions_car),
          _buildCarTypeOption(context, 'SUV', _navigateToSUVListPage, Icons.directions_car_filled),
          _buildCarTypeOption(context, 'Luxury', _navigateToLuxuryListPage, Icons.directions_car_outlined),
        ],
      ),
    );
  }

  Widget _buildCarTypeOption(BuildContext context, String title, Function onTap, IconData icon) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blueAccent),
        title: Text(
          title,
          style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),  // Arrow indicator
        onTap: () => onTap(context),
      ),
    );
  }

  void _navigateToSedanListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SedanListPage(
          startDate: startDate,
          startTime: startTime,
          endDate: endDate,
          endTime: endTime,
          pickupLocation: pickupLocation,
          dropLocation: dropLocation,
          numberOfDays: numberOfDays,
        ),
      ),
    );
  }

  void _navigateToSUVListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SUVListPage(
          startDate: startDate,
          startTime: startTime,
          endDate: endDate,
         endTime: endTime,
          pickupLocation: pickupLocation,
          dropLocation: dropLocation,
          numberOfDays: numberOfDays,
        ),
      ),
    );
  }

  void _navigateToLuxuryListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LuxuryListPage(
          startDate: startDate,
          startTime: startTime,
          endDate: endDate,
          endTime: endTime,
          pickupLocation: pickupLocation,
          dropLocation: dropLocation,
          numberOfDays: numberOfDays,
        ),
      ),
    );
  }
}
