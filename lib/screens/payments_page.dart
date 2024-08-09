import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/booking_confirmation_page.dart';

class PaymentsPage extends StatelessWidget {
  final Map<String, dynamic> car;
  final Map<String, String> driverDetails;

  PaymentsPage({required this.car, required this.driverDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[700]),
        title: Text(
          'Payment',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your payment details',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            _buildTextField('Card Number'),
            _buildTextField('Cardholder Name'),
            Row(
              children: [
                Expanded(child: _buildTextField('Expiry Date')),
                SizedBox(width: 20),
                Expanded(child: _buildTextField('CVV')),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Proceed to Booking Confirmation page after payment is successful
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingConfirmationPage(
                        car: car,
                        driverDetails: driverDetails,
                      ),
                    ),
                  );
                },
                child: Text('Confirm Payment'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.black,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
