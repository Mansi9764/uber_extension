import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSummaryPage extends StatelessWidget {
  final String carName;
  final double carPricePerDay;
  final int numberOfDays;
  final String driverName;
  final double amountPaid;

  BookingSummaryPage({
    required this.carName,
    required this.carPricePerDay,
    required this.numberOfDays,
    required this.driverName,
    required this.amountPaid,
  });

  @override
  Widget build(BuildContext context) {
    double totalCarCost = carPricePerDay * numberOfDays;

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details', style: GoogleFonts.lato()),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Booking Summary', style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Car Booked: $carName', style: GoogleFonts.lato(fontSize: 18)),
            Text('Price per Day: \$${carPricePerDay.toStringAsFixed(2)}', style: GoogleFonts.lato(fontSize: 18)),
            Text('Total Days: $numberOfDays', style: GoogleFonts.lato(fontSize: 18)),
            Text('Total Car Cost: \$${totalCarCost.toStringAsFixed(2)}', style: GoogleFonts.lato(fontSize: 18)),
            Divider(),
            Text('Driver Assigned: $driverName', style: GoogleFonts.lato(fontSize: 18)),
            Divider(),
            Text('Total Amount Paid: \$${amountPaid.toStringAsFixed(2)}', style: GoogleFonts.lato(fontSize: 18, color: Colors.green)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Potentially navigate back to the home screen or dashboard
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Return to Home', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
