import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/Hours/find_drivers_page.dart';

enum SortOption { priceLowToHigh, priceHighToLow, topPick }

class FindCarsPage extends StatefulWidget {
  final int selectedHours;
  final DateTime selectedDate;
  final String pickupLocation;
  final TimeOfDay selectedTime; 

  FindCarsPage({
    required this.selectedHours,
    required this.selectedDate,
    required this.pickupLocation, 
    required this.selectedTime,
  });

  @override
  _FindCarsPageState createState() => _FindCarsPageState();
}

class _FindCarsPageState extends State<FindCarsPage> {
  SortOption _selectedSortOption = SortOption.priceLowToHigh;

  // Single list to store all cars
  final List<Map<String, dynamic>> cars = [
    {
      "name": "Economy",
      "description": "Ford Expedition",
      "price": 10,
      "image": "assets/ford_expedition.jpg",
      "deal": "Great Deal",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
    {
      "name": "Compact",
      "description": "Kia Soul",
      "price": 20,
      "image": "assets/kia_soul.png",
      "deal": "Top Pick",
      "cancellation": "Free cancellation",
      "seats": 4,
      "luggage": 1,
    },
    {
      "name": "Economy",
      "description": "Honda Accord",
      "price": 20,
      "image": "assets/honda_accord.jpg",
      "deal": "Top Pick",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
    {
      "name": "Compact",
      "description": "Toyota Highlander",
      "price": 30,
      "image": "assets/cars/toyota_highlander.jpg",
      "deal": "Top Pick",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
    {
      "name": "Economy",
      "description": "Kia Rio or similar",
      "price": 20,
      "image": "assets/kia_soul.png",
      "deal": "Great Deal",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
    {
      "name": "Compact",
      "description": "Kia Soul or similar",
      "price": 15,
      "image": "assets/kia_soul.png",
      "deal": "Top Pick",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
    {
      "name": "Economy",
      "description": "Honda Civic or similar",
      "price": 18,
      "image": "assets/honda_civic.jpg",
      "deal": "Best Value",
      "cancellation": "Free cancellation",
      "seats": 4,
      "luggage": 2,
    },
    {
      "name": "Standard",
      "description": "Toyota Camry or similar",
      "price": 20,
      "image": "assets/toyota_camry.png",
      "deal": "Popular Choice",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 2,
    },
  ];

  // Sorting function
  void _sortCars(SortOption option) {
    setState(() {
      _selectedSortOption = option;
      cars.sort((a, b) {
        if (option == SortOption.priceLowToHigh) {
          return a['price'].compareTo(b['price']);
        } else if (option == SortOption.priceHighToLow) {
          return b['price'].compareTo(a['price']);
        } else {
          return a['deal'].compareTo(b['deal']);
        }
      });
    });
  }

  Widget _buildSortButton(BuildContext context) {
    return PopupMenuButton<SortOption>(
      icon: Icon(Icons.sort, color: Colors.black),
      onSelected: (SortOption option) {
        _sortCars(option);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SortOption>>[
        const PopupMenuItem<SortOption>(
          value: SortOption.priceLowToHigh,
          child: Text('Price: Low to High'),
        ),
        const PopupMenuItem<SortOption>(
          value: SortOption.priceHighToLow,
          child: Text('Price: High to Low'),
        ),
        const PopupMenuItem<SortOption>(
          value: SortOption.topPick,
          child: Text('Top Pick'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Choose your car',
              style: GoogleFonts.lato(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            _buildSortButton(context), // Adding the sort button to the AppBar
          ],
        ),
      ),
      body: Container(
        color: Colors.white, // White background for the entire body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLocationInfo(context, 'Pick-Up Location', widget.pickupLocation),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'No. of hours selected: ${widget.selectedHours}',
                style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final car = cars[index];
                  return _buildCarCard(context, car);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfo(BuildContext context, String label, String location) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.blue),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              '$label: $location',
              style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarCard(BuildContext context, Map<String, dynamic> car) {
    final int totalPrice = car['price'] * widget.selectedHours;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DriverPageHours(
              selectedHours: widget.selectedHours,
              selectedDate: widget.selectedDate,
              selectedTime: widget.selectedTime,
              pickupLocation: widget.pickupLocation,
              car: car,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white, // Light background for the card
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (car["deal"] != null) ...[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    car["deal"],
                    style: GoogleFonts.lato(fontSize: 12, color: Colors.purple[800]),
                  ),
                ),
                SizedBox(height: 5),
              ],
              Row(
                children: [
                  Image.asset(car["image"], width: 100, height: 60, fit: BoxFit.cover),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(car["name"], style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                        SizedBox(height: 5),
                        Text(car["description"], style: GoogleFonts.lato(fontSize: 14, color: Colors.black54)),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.person, size: 16, color: Colors.black54),
                            SizedBox(width: 5),
                            Text("${car['seats']}", style: TextStyle(color: Colors.black54)),
                            SizedBox(width: 15),
                            Icon(Icons.luggage, size: 16, color: Colors.black54),
                            SizedBox(width: 5),
                            Text("${car['luggage']}", style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("\$${car['price']}/hour", style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text("\$${totalPrice} total", style: GoogleFonts.lato(fontSize: 14, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (car["service"] != null) // Optional check if 'service' exists
                    Text(
                      car["service"],
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  Text(
                    car["cancellation"],
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  if (car["brand"] != null)
                    Image.asset(
                      'assets/${car["brand"]!.toLowerCase()}.png',
                      width: 30,
                      height: 30,
                    ), // Brand logo (e.g., AVIS)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
