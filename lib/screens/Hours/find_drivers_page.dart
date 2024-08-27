import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/Hours/booking_details_page.dart';

class DriverPageHours extends StatelessWidget {
  final int selectedHours;
  final DateTime selectedDate;
  final String pickupLocation;
  final TimeOfDay selectedTime;
  final Map<String, dynamic> car;

  DriverPageHours({
    required this.selectedHours,
    required this.selectedDate,
    required this.pickupLocation,
    required this.selectedTime,
    required this.car,
  });

  final List<Driver> drivers = [
    Driver(
      name: 'John Doe',
      experience: 5,
      rating: 4.8,
      chargePerHour: 15,
      gender: 'Male',
      age: 35,
      imagePath: 'assets/drivers/john_doe.jpg',
      languagesSpoken: ['English', 'Spanish'],
    ),
    Driver(
      name: 'Jane Smith',
      experience: 8,
      rating: 4.9,
      chargePerHour: 20,
      gender: 'Male',
      age: 40,
      imagePath: 'assets/drivers/jane_smith.jpg',
      languagesSpoken: ['English', 'French'],
    ),
    Driver(
      name: 'Michael Johnson',
      experience: 10,
      rating: 4.7,
      chargePerHour: 18,
      gender: 'Male',
      age: 45,
      imagePath: 'assets/drivers/michael_johnson.jpg',
      languagesSpoken: ['English', 'German'],
    ),
    Driver(
      name: 'Emily Davis',
      experience: 6,
      rating: 4.6,
      chargePerHour: 17,
      gender: 'Female',
      age: 30,
      imagePath: 'assets/drivers/emily_davis.jpg',
      languagesSpoken: ['English', 'Italian'],
    ),
    // Add more drivers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Your Driver',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white, // Set background to white
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          final driver = drivers[index];
          return Card(
            color: Colors.white, // White background for the card
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(driver.imagePath), // Driver's image
              ),
              title: Text(
                driver.name,
                style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age: ${driver.age}', style: TextStyle(color: Colors.black54)),
                  Text('Experience: ${driver.experience} years', style: TextStyle(color: Colors.black54)),
                  Row(
                    children: [
                      _buildRatingStars(driver.rating),
                      SizedBox(width: 5),
                      Text('${driver.rating}', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  Text('Charge per Hour: \$${driver.chargePerHour}', style: TextStyle(color: Colors.black54)),
                  Text('Gender: ${driver.gender}', style: TextStyle(color: Colors.black54)),
                  Text('Languages: ${driver.languagesSpoken.join(', ')}', style: TextStyle(color: Colors.black54)),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingDetailsPage(
                      car: car, // Pass the selected car
                      driver: driver, // Pass the selected driver
                      selectedHours: selectedHours,
                      pickupLocation: pickupLocation,
                      selectedDate: selectedDate , 
                      selectedTime: selectedTime,
                      
                      //dropoffLocation: dropoffLocation,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    int halfStars = (rating - fullStars >= 0.5) ? 1 : 0;
    int emptyStars = 5 - fullStars - halfStars;

    return Row(
      children: List.generate(
        fullStars,
        (index) => Icon(Icons.star, color: Colors.yellow, size: 16),
      )..addAll(
          List.generate(
            halfStars,
            (index) => Icon(Icons.star_half, color: Colors.yellow, size: 16),
          ),
        )..addAll(
          List.generate(
            emptyStars,
            (index) => Icon(Icons.star_border, color: Colors.yellow, size: 16),
          ),
        ),
    );
  }
}

class Driver {
  final String name;
  final int age;
  final int experience;
  final double rating;
  final int chargePerHour;
  final String gender;
  final List<String> languagesSpoken;
  final String imagePath;

  Driver({
    required this.name,
    required this.age,
    required this.experience,
    required this.rating,
    required this.chargePerHour,
    required this.gender,
    required this.languagesSpoken,
    required this.imagePath,
  });
}
