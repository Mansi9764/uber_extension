import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_card_details_page.dart'; // Import the new page

class BookingConfirmationPage extends StatelessWidget {
  final String carName;
  final double carPrice;
  final String startDate;
  final String endDate;
  final String driverName;
  final int driverExperience;
  final double driverRating;
  final int driverMilesDriven;
  final double driverPricePerMile;

  BookingConfirmationPage({
    required this.carName,
    required this.carPrice,
    required this.startDate,
    required this.endDate,
    required this.driverName,
    required this.driverExperience,
    required this.driverRating,
    required this.driverMilesDriven,
    required this.driverPricePerMile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Booking Confirmation',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Car Details',
              style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Car: $carName',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white70),
            ),
            Text(
              'Price: \$$carPrice per day',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              'Driver Details',
              style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Driver: $driverName',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white70),
            ),
            Text(
              'Experience: $driverExperience years',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white70),
            ),
            Text(
              'Rating: $driverRating',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white70),
            ),
            Text(
              'Miles Driven: $driverMilesDriven',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white70),
            ),
            Text(
              'Price per Mile: \$$driverPricePerMile',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              'Booking Dates',
              style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              'Start Date: $startDate',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white70),
            ),
            Text(
              'End Date: $endDate',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCardDetailsPage(
                        carName: carName,
                        carPrice: carPrice,
                        startDate: startDate,
                        endDate: endDate,
                        driverName: driverName,
                        driverExperience: driverExperience,
                        driverRating: driverRating,
                        driverMilesDriven: driverMilesDriven,
                        driverPricePerMile: driverPricePerMile,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Confirm Booking',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
