import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/booking_confirmation_page.dart';
import 'package:uber_final/screens/payments_page.dart';

class ReviewReservationPage extends StatelessWidget {
  final Map<String, dynamic> car;
  final String startDate;
  final String endDate;
  final double rentalCost;
  final double taxes;
  final double discount;
  final double valetServiceCost;
  final double totalCost;

  ReviewReservationPage({
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.rentalCost,
    required this.taxes,
    required this.discount,
    required this.valetServiceCost,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for the entire page
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Review reservation',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(car['image'], width: 100, height: 60, fit: BoxFit.cover), // Display car image
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Compact', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text(car['description'], style: GoogleFonts.lato(fontSize: 16, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildRentalDetail(Icons.arrow_downward, 'Rent starts', startDate, '2221 Cedar St, Alhambra, CA 91801-1748, US'),
              SizedBox(height: 20),
              _buildRentalDetail(Icons.arrow_upward, 'Rent ends', endDate, '2221 Cedar St, Alhambra, CA 91801-1748, US'),
              SizedBox(height: 20),
              Text('Fare breakdown', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 10),
              _buildFareBreakdown('Rental (3 days)', rentalCost),
              _buildFareBreakdown('Product taxes (estimated)', taxes),
              _buildFareBreakdown('Discount', discount, isNegative: true),
              _buildFareBreakdown('Valet service', valetServiceCost),
              SizedBox(height: 20),
              Divider(),
              _buildFareBreakdown('Estimated total', totalCost, isBold: true),
              SizedBox(height: 20),
              Text('Due at delivery', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 10),
              Text('\$$totalCost', style: GoogleFonts.lato(fontSize: 18, color: Colors.black)),
              SizedBox(height: 20),
              Text('Payment information', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 10),
              Text(
                'Up to \$300 deposit hold will be applied to your card at the time the vehicle is picked up for delivery. If there aren’t enough funds on your card, your delivery will be canceled. We will add the protection option you have on your Avis profile. Any tips will be charged to your account.',
                style: GoogleFonts.lato(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentsPage(
          car: car,
          driverDetails: {
            'name': 'John Doe', // Replace with actual driver details
            'license': 'ABC123456',
            'contact': '+1 234 567 8901',
          },
        ),
      ),
    );
  },
          child: Text('Agree to terms'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.black,
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildRentalDetail(IconData icon, String title, String dateTime, String location) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.black54),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
            Text(dateTime, style: GoogleFonts.lato(fontSize: 16, color: Colors.black54)),
            Text(location, style: GoogleFonts.lato(fontSize: 14, color: Colors.black54)),
          ],
        ),
      ],
    );
  }

  Widget _buildFareBreakdown(String title, double amount, {bool isBold = false, bool isNegative = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: Colors.black),
          ),
          Text(
            '${isNegative ? '-' : ''}\$${amount.toStringAsFixed(2)}',
            style: GoogleFonts.lato(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
