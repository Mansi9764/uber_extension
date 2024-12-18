import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uber_final/screens/Daily/car_type_selection.dart';

class CarRentalHomePage extends StatefulWidget {
  @override
  _CarRentalHomePageState createState() => _CarRentalHomePageState();
}

class _CarRentalHomePageState extends State<CarRentalHomePage> {
  DateTime? _pickupDate;
  TimeOfDay? _pickupTime;
  DateTime? _dropDate;
  TimeOfDay? _dropTime;
  String? _pickupLocation;
  String? _dropLocation;

  // Method to calculate the number of days between pickup and drop-off
  int _calculateNumberOfDays() {
    if (_pickupDate != null && _dropDate != null) {
      return _dropDate!.difference(_pickupDate!).inDays;
    }
    return 0; // Return 0 if one of the dates is not selected
  }

  // Function to pick a date
  Future<void> _selectDate(BuildContext context, bool isPickup) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isPickup ? _pickupDate ?? DateTime.now() : _dropDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        if (isPickup) {
          _pickupDate = pickedDate;
        } else {
          _dropDate = pickedDate;
        }
      });
    }
  }

  // Function to pick a time
  Future<void> _selectTime(BuildContext context, bool isPickup) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isPickup ? _pickupTime ?? TimeOfDay.now() : _dropTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        if (isPickup) {
          _pickupTime = pickedTime;
        } else {
          _dropTime = pickedTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top illustration
            Container(
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/illustration.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Multi-Day Booking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pickup location
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Pickup location',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.location_pin, color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      _pickupLocation = value;
                    },
                  ),SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Drop-off location',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.location_pin, color: Colors.black),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) => _dropLocation = value,
                  ),
                  SizedBox(height: 5),
                  // Pickup Date
                  GestureDetector(
                    onTap: () => _selectDate(context, true),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: _pickupDate != null
                              ? 'Pick Up Date: ' + DateFormat.yMMMd().format(_pickupDate!)
                              : 'Pick Up Date',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  // Pickup Time
                  GestureDetector(
                    onTap: () => _selectTime(context, true),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: _pickupTime != null
                              ? 'Pick Up Time: ' + _pickupTime!.format(context)
                              : 'Pick Up Time',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.access_time, color: Colors.black),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  // Drop Date
                  GestureDetector(
                    onTap: () => _selectDate(context, false),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: _dropDate != null
                              ? 'Drop Date: ' + DateFormat.yMMMd().format(_dropDate!)
                              : 'Drop Date',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  // Drop Time
                  GestureDetector(
                    onTap: () => _selectTime(context, false),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: _dropTime != null
                              ? 'Drop Time: ' + _dropTime!.format(context)
                              : 'Drop Time',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.access_time, color: Colors.black),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarTypeSelectionPage(
                        startDate: _pickupDate != null ? DateFormat.yMMMd().format(_pickupDate!) : '',
                        startTime: _pickupTime != null ? _pickupTime!.format(context) : '',
                        endDate: _dropDate != null ? DateFormat.yMMMd().format(_dropDate!) : '',
                        endTime: _dropTime != null ? _dropTime!.format(context) : '',
                        pickupLocation: _pickupLocation ?? '',
                        dropLocation: _dropLocation ?? '',
                        numberOfDays: _calculateNumberOfDays(),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Book a Car',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8), // Spacing between text and icon
                    Icon(Icons.arrow_forward), // Arrow icon
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
