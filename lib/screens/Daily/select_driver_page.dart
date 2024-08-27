import 'package:flutter/material.dart';
import 'car.dart'; // Import the Car model
import '../Driver.dart';

class DriverPageDays extends StatelessWidget {
  final Car car;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String pickupLocation;
  final String dropLocation;
  final int numberOfDays;

  DriverPageDays({
    required this.car,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.pickupLocation,
    required this.dropLocation,
    required this.numberOfDays, 
    //required String shift, 
  });

  final List<Driver> drivers = [
    Driver(
      name: 'John Doe',
      experience: 5,
      rating: 4.8,
      chargePerDay: 50,
      gender: 'Male',
      age: 35,
      imagePath: 'assets/drivers/john_doe.jpg',
      languagesSpoken: ['English', 'Spanish'],
    ),
    Driver(
      name: 'Jane Smith',
      experience: 8,
      rating: 4.9,
      chargePerDay: 70,
      gender: 'Female',
      age: 40,
      imagePath: 'assets/drivers/jane_smith.jpg',
      languagesSpoken: ['English', 'French'],
    ),
    Driver(
      name: 'Michael Johnson',
      experience: 10,
      rating: 4.7,
      chargePerDay: 80,
      gender: 'Male',
      age: 45,
      imagePath: 'assets/drivers/michael_johnson.jpg',
      languagesSpoken: ['English', 'German'],
    ),
    Driver(
      name: 'Emily Davis',
      experience: 6,
      rating: 4.6,
      chargePerDay: 60,
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
        backgroundColor: Colors.black,
        title: Text('Select Driver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              car.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${car.price} per day',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              'Rental Period: $startDate $startTime - $endDate $endTime',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Pick-Up: $pickupLocation',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Drop-Off: $dropLocation',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: drivers.length,
                itemBuilder: (context, index) {
                  return _buildDriverItem(context, drivers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverItem(BuildContext context, Driver driver) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(driver.imagePath),
          radius: 30,
        ),
        title: Text(
          driver.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Experience: ${driver.experience} years'),
            Text('Age: ${driver.age}'),
            Text('Rating: ${driver.rating} ★'),
            Text('Charge: \$${driver.chargePerDay} per day'),
            Text('Gender: ${driver.gender}'),
            Text('Languages: ${driver.languagesSpoken.join(', ')}'),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Handle driver selection, e.g., navigate to a booking confirmation page
        },
      ),
    );
  }
}
