import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/final_review_reservation.dart';

class ReviewPage extends StatelessWidget {
  final Map<String, dynamic> car;
  final String startDate;
  final String endDate;

  ReviewPage({required this.car, required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Car details',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
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
                SizedBox(height: 10),
              ],
              Center(
                child: Image.asset(car['image'], width: 250, height: 150, fit: BoxFit.cover),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(car['description'], style: GoogleFonts.lato(fontSize: 18, color: Colors.white)),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconText(Icons.person, "${car['seats']} seats"),
                  _buildIconText(Icons.luggage, "${car['luggage']} bags"),
                  _buildIconText(Icons.door_front_door, "4 doors"),
                  _buildIconText(Icons.settings, "Auto"),
                ],
              ),
              SizedBox(height: 20),
              Text('How valet works', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 10),
              _buildListTile(Icons.schedule, 'Schedule delivery and return of your car'),
              _buildListTile(Icons.location_on, 'Track your delivery in the app'),
              _buildListTile(Icons.cancel, 'Cancel for free up to 2 hours ahead'),
              SizedBox(height: 20),
              Text('Location details', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 10),
              _buildLocationDetail('Deliver to', '2221 Cedar St, Alhambra, CA 91801-1748, US'),
              _buildLocationDetail('Collection from', '2221 Cedar St, Alhambra, CA 91801-1748, US'),
              SizedBox(height: 20),
              _buildTotalPrice(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54),
        SizedBox(height: 5),
        Text(text, style: GoogleFonts.lato(fontSize: 14, color: Colors.black54)),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(text, style: GoogleFonts.lato(fontSize: 14, color: Colors.black54)),
    );
  }

  Widget _buildLocationDetail(String title, String address) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.lato(fontSize: 14, color: Colors.black)),
              SizedBox(height: 5),
              Text(address, style: GoogleFonts.lato(fontSize: 14, color: Colors.black54)),
            ],
          ),
          TextButton(onPressed: () {}, child: Text('Edit', style: TextStyle(color: Colors.blue))),
        ],
      ),
    );
  }

  Widget _buildTotalPrice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Divider(thickness: 1, color: Colors.black26),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${car['totalPrice']} total", style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              Text("Valet fee included", style: GoogleFonts.lato(fontSize: 12, color: Colors.black54)),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReviewReservationPage(
          car: car,
          startDate: startDate,
          endDate: endDate,
          rentalCost: 203.97,  // Replace with actual calculation
          taxes: 22.68,        // Replace with actual calculation
          discount: -10.20,    // Replace with actual calculation
          valetServiceCost: 0.00, // Replace with actual calculation
          totalCost: 216.47,   // Replace with actual calculation
        ),
      ),
    );
  },
  child: Text('Continue'),
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.black,
    textStyle: TextStyle(color: Colors.white),
  ),
),

          ),
        ],
      ),
    );
  }
}
