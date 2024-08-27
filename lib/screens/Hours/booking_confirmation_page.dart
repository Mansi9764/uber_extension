import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/Hours/find_drivers_page.dart';
import 'start_ride_page.dart'; // Import the StartRidePage

class BookingConfirmedPage extends StatelessWidget {
  final Map<String, dynamic> car;
  final Driver driver;
  final int selectedHours;
  final String pickupLocation;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final int totalPrice;

  BookingConfirmedPage({
    required this.car,
    required this.driver,
    required this.selectedHours,
    required this.pickupLocation,
    required this.selectedDate,
    required this.selectedTime,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Confirmed',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your booking has been confirmed!',
              style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Booking Amount: \$${totalPrice}',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _navigateToAddRideLocation(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Add First Ride Location', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAddRideLocation(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PlanYourRidePage(
        initialPickupLocation: pickupLocation,
        // initialDropoffLocation: '', // Initially empty, user can input drop-off location on the next page
        // selectedDate: selectedDate,
        // selectedTime: selectedTime,
      ),
    ));
  }
}
