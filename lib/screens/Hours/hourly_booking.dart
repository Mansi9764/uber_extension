import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'find_cars.dart';

class HourlyBookingPage extends StatefulWidget {
  @override
  _HourlyBookingPageState createState() => _HourlyBookingPageState();
}

class _HourlyBookingPageState extends State<HourlyBookingPage> {
  int _selectedHours = 2; // Start with a minimum of 2 hours
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedPickupLocation;
  bool _isLeaveLater = false; // Tracks if "Leave Later" is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Hourly Booking',
          style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLocationSelection('Pick-Up Location', _selectedPickupLocation, _selectPickupLocation),
                  _buildSectionTitle('How much Time do you need?'),
                  _buildHourSelection(),
                  //_buildSectionTitle('Leave Now or Leave Later'),
                  _buildLeaveOptions(),
                  if (_isLeaveLater) ...[
                    _buildSectionTitle('Select Date'),
                    _buildDateSelection(),
                    _buildSectionTitle('Start Time'),
                    _buildTimeSelection(),
                  ],
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: _buildConfirmButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center align the buttons
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLeaveLater = false;
                  _selectedDate = null; // Reset the date and time when "Leave Now" is selected
                  _selectedTime = null;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8), // Very small padding
                backgroundColor: _isLeaveLater ? Colors.grey[300] : Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), // Smaller border radius
              ),
              child: Text(
                'Leave Now',
                style: GoogleFonts.lato(
                  fontSize: 12, // Very small font size
                  fontWeight: FontWeight.bold,
                  color: _isLeaveLater ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 8), // Reduced spacing between buttons
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLeaveLater = true;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8), // Very small padding
                backgroundColor: _isLeaveLater ? Colors.black : Colors.grey[300],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), // Smaller border radius
              ),
              child: Text(
                'Leave Later',
                style: GoogleFonts.lato(
                  fontSize: 12, // Very small font size
                  fontWeight: FontWeight.bold,
                  color: _isLeaveLater ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHourAdjustButton(Icons.remove, () {
                if (_selectedHours > 2) setState(() => _selectedHours--); // Ensure minimum is 2 hours
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '$_selectedHours hour${_selectedHours > 1 ? 's' : ''}',
                  style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              _buildHourAdjustButton(Icons.add, () {
                if (_selectedHours < 12) setState(() => _selectedHours++); // Allow a maximum of 12 hours
              }),
            ],
          ),
          _buildMilesInfo(), // Miles info directly below the hours
        ],
      ),
    );
  }

  Widget _buildHourAdjustButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        backgroundColor: Colors.grey[300],
        elevation: 2,
      ),
      child: Icon(icon, color: Colors.black),
    );
  }

  Widget _buildMilesInfo() {
    int totalMiles = 30 + ((_selectedHours - 2) * 15); // 30 miles base + 15 miles for each hour beyond 2
    return Padding(
      padding: const EdgeInsets.only(top: 8.0), // Slight top padding for spacing
      child: Text(
        '$totalMiles miles included',
        style: GoogleFonts.lato(fontSize: 16, color: Colors.grey), // Display in grey
      ),
    );
  }

  Widget _buildLocationSelection(String title, String? location, Function onTap) {
    return _buildSelectionContainer(
      title,
      location ?? 'Select Pick Up location',
      Icons.location_on,
      onTap,
    );
  }

  Widget _buildDateSelection() {
    return _buildSelectionContainer(
      'Selected Date',
      _selectedDate == null ? 'No date selected' : '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
      Icons.calendar_today,
      _selectDate,
    );
  }

  Widget _buildTimeSelection() {
    return _buildSelectionContainer(
      'Selected Time',
      _selectedTime == null ? 'No time selected' : _selectedTime!.format(context),
      Icons.access_time,
      _selectTime,
    );
  }

  Widget _buildSelectionContainer(String title, String value, IconData icon, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.black),
                ),
              ),
              Icon(icon, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      if (_selectedPickupLocation != null && (!_isLeaveLater || (_selectedDate != null && _selectedTime != null))) {
        DateTime departureDateTime;

        if (_isLeaveLater) {
          // Combine selected date and time for "Leave Later"
          departureDateTime = DateTime(
            _selectedDate!.year,
            _selectedDate!.month,
            _selectedDate!.day,
            _selectedTime!.hour,
            _selectedTime!.minute,
          );
        } else {
          // Use current date and time for "Leave Now"
          departureDateTime = DateTime.now();
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FindCarsPage(
              pickupLocation: _selectedPickupLocation!,
              selectedDate: departureDateTime,
              selectedHours: _selectedHours,
              selectedTime: TimeOfDay.fromDateTime(departureDateTime), // Pass TimeOfDay based on the date and time
            ),
          ),
        );
      } else {
        // Display an error message or dialog if pickup location is not selected or required fields are not filled
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fill all required fields!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 16),
      backgroundColor: Colors.black, // Keep the button black
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Book Car',
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(width: 8), // Space between text and icon
        Icon(Icons.arrow_forward, color: Colors.white),
      ],
    ),
  );
}


  void _selectPickupLocation() async {
    String? location = await _showLocationInputDialog('Pick-Up Location');
    if (location != null) setState(() => _selectedPickupLocation = location);
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1, 0),
    );
    if (picked != null && picked != _selectedDate) setState(() => _selectedDate = picked);
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != _selectedTime) setState(() => _selectedTime = picked);
  }

  Future<String?> _showLocationInputDialog(String title) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        String? locationInput;
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          content: TextField(
            style: TextStyle(color: Colors.black),
            onChanged: (value) => locationInput = value,
            decoration: InputDecoration(
              hintText: "Enter location",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.black)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.black)),
              onPressed: () => Navigator.of(context).pop(locationInput),
            ),
          ],
        );
      },
    );
  }
}
