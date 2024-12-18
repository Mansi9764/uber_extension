import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_driver_page.dart'; // Import the new page
import 'package:uber_final/screens/Daily/car.dart';

class SUVListPage extends StatelessWidget {
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String pickupLocation;
  final String dropLocation;
  final int numberOfDays;

  SUVListPage({
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Available SUVs',
          style: GoogleFonts.lato(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildCarItem(
              context,
              Car(
                name: 'Toyota Highlander 2021',
                description: '5 seats, Automatic, Air Conditioning, Petrol',
                price: 70.0,
                rating: 4.5,
                imagePath: 'assets/cars/toyota_highlander.jpg', // Add image path
              ),
            ),
            _buildCarItem(
              context,
              Car(
                name: 'Ford Explorer 2020',
                description: '7 seats, Automatic, Air Conditioning, Diesel',
                price: 75.0,
                rating: 4.0,
                imagePath: 'assets/cars/ford_explorer.jpg', // Add image path
              ),
            ),
            _buildCarItem(
              context,
              Car(
                name: 'Honda Pilot 2019',
                description: '8 seats, Automatic, Air Conditioning, Petrol',
                price: 80.0,
                rating: 3.0,
                imagePath: 'assets/cars/honda_pilot.jpg', // Add image path
              ),
            ),
            _buildCarItem(
              context,
              Car(
                name: 'Chevrolet Tahoe 2021',
                description: '7 seats, Automatic, Air Conditioning, Diesel',
                price: 85.0,
                rating: 2.0,
                imagePath: 'assets/cars/chevrolet_tahoe.jpg', // Add image path
              ),
            ),
            _buildCarItem(
              context,
              Car(
                name: 'Nissan Pathfinder 2018',
                description: '7 seats, Automatic, Air Conditioning, Petrol',
                price: 78.0,
                rating: 4.5,
                imagePath: 'assets/cars/nissan_pathfinder.jpg', // Add image path
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarItem(BuildContext context, Car car) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DriverPageDays(
              car: car, // Pass the instance of Car here
              startDate: startDate,
              endDate: endDate,
              startTime: startTime,
              endTime: endTime,
              pickupLocation: pickupLocation,
              dropLocation: dropLocation,
              numberOfDays: numberOfDays,
              
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                car.imagePath,
                width: 100,
                height: 60,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.name,
                      style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      car.description,
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '\$${car.price} per day',
                          style: TextStyle(color: Colors.black54),
                        ),
                        SizedBox(width: 10),
                        _buildRatingStars(car.rating),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black),
            ],
          ),
        ),
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
      )
        ..addAll(
          List.generate(
            halfStars,
            (index) => Icon(Icons.star_half, color: Colors.yellow, size: 16),
          ),
        )
        ..addAll(
          List.generate(
            emptyStars,
            (index) => Icon(Icons.star_border, color: Colors.yellow, size: 16),
          ),
        ),
    );
  }
}
