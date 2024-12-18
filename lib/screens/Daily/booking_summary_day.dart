import 'package:flutter/material.dart';
import 'package:uber_final/screens/Daily/Booking_confirmation_daily.dart';
import 'package:uber_final/screens/Driver.dart';
import 'car.dart';  // Ensure this model is correctly defined in your project

class BookingDetailsPageDay extends StatelessWidget {
  final Car car;
  final Driver driver;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String pickupLocation;
  final String dropLocation;
  final int numberOfDays;

  BookingDetailsPageDay({
    required this.car,
    required this.driver,
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
        backgroundColor: Colors.black,
        title: Text("Booking Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Review and Confirm Your Booking",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Car: ${car.name}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "\$${car.price} per day",
                        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(car.imagePath), // Ensure imagePath is valid
                  radius: 30,
                ),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
              title: Text("${driver.name} - ${driver.experience} years experience"),
              subtitle: Text("Rating: ${driver.rating} ★"),
            ),
            Divider(),
            Text(
              "Dates: $startDate to $endDate",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Pick-Up: $pickupLocation",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Drop-Off: $dropLocation",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Total Days: $numberOfDays",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Total Charge: \$${(car.price * numberOfDays).toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Here, instead of showing a dialog, navigate directly to the confirmation page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingConfirmationPage()),
                );
              },
              child: Text('Confirm Booking'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
                      ],
                    ),
                  ),
                );
              }
            }
