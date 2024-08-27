import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/Hours/booking_confirmation_page.dart';
import 'package:uber_final/screens/Hours/find_drivers_page.dart';

class BookingDetailsPage extends StatelessWidget {
  final Map<String, dynamic> car;
  final Driver driver;
  final int selectedHours;
  final String pickupLocation;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  BookingDetailsPage({
    required this.car,
    required this.driver,
    required this.selectedHours,
    required this.pickupLocation,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    final int carTotalPrice = car['price'] * selectedHours;
    final int driverTotalPrice = driver.chargePerHour * selectedHours;
    final int totalPrice = carTotalPrice + driverTotalPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Details',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Car Details'),
            _buildCarDetails(car, carTotalPrice),
            SizedBox(height: 20),
            _buildSectionTitle('Driver Details'),
            _buildDriverDetails(driver, driverTotalPrice),
            SizedBox(height: 20),
            _buildSectionTitle('Total Estimated Price'),
            _buildPriceDetails(carTotalPrice, driverTotalPrice, totalPrice),
            SizedBox(height: 20),
            _buildConfirmButton(context, totalPrice),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }

  Widget _buildCarDetails(Map<String, dynamic> car, int carTotalPrice) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(car["image"], width: 100, height: 60, fit: BoxFit.cover),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(car["name"], style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: 5),
                  Text(car["description"], style: GoogleFonts.lato(fontSize: 14, color: Colors.black87)),
                  SizedBox(height: 5),
                  _buildCarSpecs(car),
                  SizedBox(height: 5),
                  Text('Total Car Price: \$${carTotalPrice}', style: GoogleFonts.lato(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarSpecs(Map<String, dynamic> car) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.event_seat, color: Colors.black, size: 18),
            SizedBox(width: 5),
            Text('Seats: ${car['seats']}', style: GoogleFonts.lato(fontSize: 14, color: Colors.black87)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.work, color: Colors.black, size: 18),
            SizedBox(width: 5),
            Text('Luggage: ${car['luggage']}', style: GoogleFonts.lato(fontSize: 14, color: Colors.black87)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.attach_money, color: Colors.black, size: 18),
            SizedBox(width: 5),
            Text('Price: \$${car['price']}/hour', style: GoogleFonts.lato(fontSize: 14, color: Colors.black87)),
          ],
        ),
      ],
    );
  }

  Widget _buildDriverDetails(Driver driver, int driverTotalPrice) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(driver.imagePath),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(driver.name, style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: 5),
                  Text('Experience: ${driver.experience} years', style: GoogleFonts.lato(fontSize: 14, color: Colors.black87)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.black, size: 18),
                      SizedBox(width: 5),
                      Text('Rating: ${driver.rating}', style: GoogleFonts.lato(fontSize: 14, color: Colors.black87)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text('Charge per Hour: \$${driver.chargePerHour}', style: GoogleFonts.lato(fontSize: 14, color: Colors.black87)),
                  SizedBox(height: 5),
                  Text('Total Driver Price: \$${driverTotalPrice}', style: GoogleFonts.lato(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetails(int carTotalPrice, int driverTotalPrice, int totalPrice) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPriceRow('Total Car Price:', carTotalPrice),
            _buildPriceRow('Total Driver Price:', driverTotalPrice),
            Divider(color: Colors.black),
            _buildPriceRow('Total Estimated Price:', totalPrice, isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, int price, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.lato(fontSize: isTotal ? 20 : 18, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: Colors.black),
        ),
        Text(
          '\$${price}',
          style: GoogleFonts.lato(fontSize: isTotal ? 20 : 18, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context, int totalPrice) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BookingConfirmedPage(
            car: car,
            driver: driver,
            selectedHours: selectedHours,
            pickupLocation: pickupLocation,
            selectedDate: selectedDate,
            selectedTime: selectedTime,
            totalPrice: totalPrice,
          ),
        ));
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text('Confirm Booking', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
    ),
  );
}


  void _showConfirmationDialog(BuildContext context, int totalPrice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmed', style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold)),
          content: Text(
            'Your ride has been confirmed on ${selectedDate.day}/${selectedDate.month}/${selectedDate.year} at ${selectedTime}.\n\n'
            'Booking Amount: \$${totalPrice}',
            style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
          ),
          actions: [
            TextButton(
              child: Text('OK', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

}
