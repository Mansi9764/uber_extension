import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uber_final/screens/Hours/ride_confirmed_page.dart';

// PlanYourRidePage - The initial page where the user plans their ride
class PlanYourRidePage extends StatefulWidget {
  final String initialPickupLocation; // Accept initial pickup location as a parameter

  PlanYourRidePage({required this.initialPickupLocation});

  @override
  _PlanYourRidePageState createState() => _PlanYourRidePageState();
}

class _PlanYourRidePageState extends State<PlanYourRidePage> {
  // List to store sets of pickup and dropoff controllers
  List<Map<String, TextEditingController>> _locations = [];

  @override
  void initState() {
    super.initState();
    // Initialize with the first set of pickup and dropoff locations
    _addNewLocation(widget.initialPickupLocation, '');
  }

  // Method to add a new set of pickup and dropoff fields
  void _addNewLocation(String pickup, String dropoff) {
    setState(() {
      _locations.add({
        'pickup': TextEditingController(text: pickup),
        'dropoff': TextEditingController(text: dropoff),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Plan your ride',
          style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Use Expanded for ListView to make it scrollable and take remaining space
            Expanded(
              child: ListView.builder(
                itemCount: _locations.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _buildLocationInputField(
                        _locations[index]['pickup']!,
                        'Pickup Location',
                        Icons.circle,
                        Colors.blue,
                        isPickup: true,
                      ),
                      SizedBox(height: 10),
                      _buildLocationInputField(
                        _locations[index]['dropoff']!,
                        'Where to?',
                        Icons.square,
                        Colors.red,
                      ),
                      if (index < _locations.length - 1)
                        Divider(
                          color: Colors.grey,
                          height: 30,
                        ),
                    ],
                  );
                },
              ),
            ),
            _buildAddButton(),
            _buildConfirmRideButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInputField(
    TextEditingController controller,
    String hint,
    IconData icon,
    Color iconColor, {
    bool isPickup = false,
  }) {
    return Container(
      height: 50, // Consistent height for input fields
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(icon, color: iconColor, size: 20), // Smaller icon size
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                color: Colors.black, // Text color set to black
              ),
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(Icons.add, color: Colors.black, size: 30),
        onPressed: () {
          // Add a new set of pickup and dropoff input fields
          _addNewLocation('', '');
        },
      ),
    );
  }

  Widget _buildConfirmRideButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Confirm ride functionality here
            _confirmRide(context);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text('Confirm Ride', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }

  void _confirmRide(BuildContext context) {
    // Get the first pickup and dropoff location
    String pickupLocation = _locations.first['pickup']!.text;
    String dropoffLocation = _locations.first['dropoff']!.text;

    // Navigate to RideConfirmedPage
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RideConfirmedPage(
          pickupLocation: pickupLocation,
          dropoffLocation: dropoffLocation,
        ),
      ),
    );
  }
}
