import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSuccessPage extends StatelessWidget {
  final String transactionId;
  final double amountPaid;

  PaymentSuccessPage({required this.transactionId, required this.amountPaid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Successful', style: GoogleFonts.lato()),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check_circle_outline, size: 100, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Your payment was successfully processed!',
              style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Transaction ID: $transactionId',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.black54),
            ),
            Text(
              'Amount Paid: \$${amountPaid.toStringAsFixed(2)}',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home or another relevant page
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Go to home', style: TextStyle(color: Colors.white)),
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
