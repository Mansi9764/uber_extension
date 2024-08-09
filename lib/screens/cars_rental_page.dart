import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uber_final/screens/available_cars_page.dart';

class CarRentalHomePage extends StatefulWidget {
  @override
  _CarRentalHomePageState createState() => _CarRentalHomePageState();
}

class _CarRentalHomePageState extends State<CarRentalHomePage> {
  DateTime? _pickupDate;
  TimeOfDay? _pickupTime;
  DateTime? _dropDate;
  TimeOfDay? _dropTime;
  String? _driverAge = '30+ years old';

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

  // Function to show the driver's age selection bottom sheet
  void _showDriverAgeSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Main driver\'s age',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'A young driver fee may apply for drivers under the age of 30',
                  style: TextStyle(color: const Color.fromARGB(255, 172, 171, 171)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
              RadioListTile<String>(
                title: const Text('18-20 years old'),
                value: '18-20 years old',
                groupValue: _driverAge,
                onChanged: (value) {
                  setState(() {
                    _driverAge = value;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('21-24 years old'),
                value: '21-24 years old',
                groupValue: _driverAge,
                onChanged: (value) {
                  setState(() {
                    _driverAge = value;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('25-29 years old'),
                value: '25-29 years old',
                groupValue: _driverAge,
                onChanged: (value) {
                  setState(() {
                    _driverAge = value;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('30+ years old'),
                value: '30+ years old',
                groupValue: _driverAge,
                onChanged: (value) {
                  setState(() {
                    _driverAge = value;
                  });
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Apply'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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
                'Rental cars delivered',
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
                      labelText: 'Pickup near 2221 Cedar St',
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
                  SizedBox(height: 5),
                  // Main driver's age
                  GestureDetector(
                    onTap: () {
                      _showDriverAgeSelection(context);
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Main driver\'s age: $_driverAge',
                          labelStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.person, color: Colors.black),
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
            // Valet section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Valet is available in your city',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/valet_image_1.png', height: 100),
                      Image.asset('assets/valet_image_2.png', height: 100),
                    ],
                  ),
                ],
              ),
            ),
            // Find cars button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AvailableCarsPage(
                        startDate: _pickupDate != null ? DateFormat.yMMMd().format(_pickupDate!) : '',
                        startTime: _pickupTime != null ? _pickupTime!.format(context) : '',
                        endDate: _dropDate != null ? DateFormat.yMMMd().format(_dropDate!) : '',
                        endTime: _dropTime != null ? _dropTime!.format(context) : '',
                      ),
                    ),
                  );
                },
                child: Text('Find cars'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
