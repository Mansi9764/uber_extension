import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/review_page.dart';

enum SortOption { priceLowToHigh, priceHighToLow, topPick }

class AvailableCarsPage extends StatefulWidget {
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;

  AvailableCarsPage({required this.startDate, required this.startTime,required this.endDate,required this.endTime});

  @override
  _AvailableCarsPageState createState() => _AvailableCarsPageState();
}

class _AvailableCarsPageState extends State<AvailableCarsPage> {
  int _selectedIndex = 0;
  SortOption _selectedSortOption = SortOption.priceLowToHigh;

  // Sample data for valet delivery cars
  final List<Map<String, dynamic>> valetDeliveryCars = [
    {
      "name": "Economy",
      "description": "Ford Expedition",
      "price": 72,
      "image": "assets/ford_expedition.jpg",
      "totalPrice": 216,
      "deal": "Great Deal",
      "service": "Valet service included",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
    {
      "name": "Compact",
      "description": "Kia Soul",
      "price": 73,
      "image": "assets/kia_soul.png",
      "totalPrice": 220,
      "deal": "Top Pick",
      "service": "Valet service included",
      "cancellation": "Free cancellation",
      "seats": 4,
      "luggage": 1,
    },
    {
      "name": "Economy",
      "description": "Honda Accord",
      "price": 73,
      "image": "assets/honda_accord.jpg",
      "totalPrice": 220,
      "deal": "Top Pick",
      "service": "Valet service included",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
    {
      "name": "Compact",
      "description": "Toyota Highlander",
      "price": 73,
      "image": "assets/toyota_highlander.jpg",
      "totalPrice": 220,
      "deal": "Top Pick",
      "service": "Valet service included",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
    {
      "name": "Economy",
      "description": "Kia Rio or similar",
      "price": 72,
      "image": "assets/kia_soul.png",
      "totalPrice": 216,
      "deal": "Great Deal",
      "service": "Valet service included",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
    {
      "name": "Compact",
      "description": "Kia Soul or similar",
      "price": 73,
      "image": "assets/kia_soul.png",
      "totalPrice": 220,
      "deal": "Top Pick",
      "service": "Valet service included",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 1,
    },
  ];

  // Sample data for self pickup cars
  final List<Map<String, dynamic>> selfPickupCars = [
    {
      "name": "Economy",
      "description": "Honda Civic or similar",
      "price": 68,
      "image": "assets/honda_civic.jpg",
      "totalPrice": 204,
      "deal": "Best Value",
      "service": "Self pickup",
      "cancellation": "Free cancellation",
      "seats": 4,
      "luggage": 2,
    },
    {
      "name": "Standard",
      "description": "Toyota Camry or similar",
      "price": 75,
      "image": "assets/toyota_camry.png",
      "totalPrice": 225,
      "deal": "Popular Choice",
      "service": "Self pickup",
      "cancellation": "Free cancellation",
      "seats": 5,
      "luggage": 2,
    },
  ];

  // Sorting function
  void _sortCars(SortOption option) {
    setState(() {
      _selectedSortOption = option;
      if (_selectedIndex == 0) {
        valetDeliveryCars.sort((a, b) {
          if (option == SortOption.priceLowToHigh) {
            return a['price'].compareTo(b['price']);
          } else if (option == SortOption.priceHighToLow) {
            return b['price'].compareTo(a['price']);
          } else {
            return a['deal'].compareTo(b['deal']);
          }
        });
      } else {
        selfPickupCars.sort((a, b) {
          if (option == SortOption.priceLowToHigh) {
            return a['price'].compareTo(b['price']);
          } else if (option == SortOption.priceHighToLow) {
            return b['price'].compareTo(a['price']);
          } else {
            return a['deal'].compareTo(b['deal']);
          }
        });
      }
    });
  }

  // Additional code inside build method to implement the sort UI
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
              style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '${widget.startDate} - ${widget.endDate}',
                style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _selectedIndex == 0 ? valetDeliveryCars.length : selfPickupCars.length,
                itemBuilder: (context, index) {
                  final car = _selectedIndex == 0 ? valetDeliveryCars[index] : selfPickupCars[index];
                  return _buildCarCard(context, car);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping, color: Colors.black), label: 'Valet delivery'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on, color: Colors.black), label: 'Self pickup'),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildCarCard(BuildContext context, Map<String, dynamic> car) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewPage(
            car: car,
            startDate: widget.startDate,
            endDate: widget.endDate,
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
                    Text("\$${car['price']}/day", style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                    Text("\$${car['totalPrice']} total", style: GoogleFonts.lato(fontSize: 14, color: Colors.black54)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
