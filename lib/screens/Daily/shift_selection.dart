// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:uber_final/screens/Daily/select_driver_page.dart';
// import 'car.dart';

// class ShiftSelectionPage extends StatefulWidget {
//   final String startDate;
//   final String endDate;
//   final String startTime;
//   final String endTime;
//   final String pickupLocation;
//   final String dropLocation;
//   final int numberOfDays;
//   final Car car;

//   ShiftSelectionPage({
//     required this.startDate,
//     required this.endDate,
//     required this.startTime,
//     required this.endTime,
//     required this.pickupLocation,
//     required this.dropLocation,
//     required this.numberOfDays,
//     required this.car,
//   });

//   @override
//   _ShiftSelectionPageState createState() => _ShiftSelectionPageState();
// }

// class _ShiftSelectionPageState extends State<ShiftSelectionPage> {
//   String selectedShift = '';
//   int _nightShiftDays = 0;
//   bool _isNightShift = false;
//   int _additionalCharges = 0;

//   void _incrementNightShiftDays() {
//     if (_nightShiftDays < widget.numberOfDays) {
//       setState(() {
//         _nightShiftDays++;
//         _additionalCharges = _nightShiftDays * 20; // Example: $20 per night shift day
//       });
//     }
//   }

//   void _navigateToDriverPage() {
//     if (selectedShift.isEmpty) {
//       // Show a warning if no shift is selected
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please select a shift type to continue.'),
//         ),
//       );
//       return;
//     }

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DriverPageDays(
//           car: widget.car,
//           shift: selectedShift,
//           startDate: widget.startDate,
//           endDate: widget.endDate,
//           startTime: widget.startTime,
//           endTime: widget.endTime,
//           pickupLocation: widget.pickupLocation,
//           dropLocation: widget.dropLocation,
//           numberOfDays: widget.numberOfDays,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Choose Your Preferred Shift',
//           style: GoogleFonts.lato(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 "When would you like to travel?",
//                 style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               SizedBox(height: 20),
//               _buildShiftOption(
//                 context,
//                 title: 'Day',
//                 description: 'Experience safe and comfortable journeys during daylight hours.',
//                 imagePath: 'assets/images/day_shift.jpg',
//                 backgroundColor: Colors.blue,
//                 onTap: () {
//                   setState(() {
//                     selectedShift = 'Day';
//                     _isNightShift = false; // Reset night shift selection
//                     _nightShiftDays = 0;
//                     _additionalCharges = 0;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),
//               _buildShiftOption(
//                 context,
//                 title: 'Night',
//                 description: 'Enjoy peaceful rides under the stars, perfect for late-night travels.',
//                 imagePath: 'assets/images/night_shift.jpg',
//                 backgroundColor: Colors.green,
//                 onTap: () {
//                   setState(() {
//                     selectedShift = 'Night';
//                     _isNightShift = true;
//                   });
//                 },
//               ),
//               if (_isNightShift) ...[
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Night Shift Days: $_nightShiftDays",
//                       style: TextStyle(fontSize: 16, color: Colors.black),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.add, color: Colors.blue),
//                       onPressed: _incrementNightShiftDays,
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "Additional Charges: \$$_additionalCharges",
//                   style: TextStyle(fontSize: 16, color: Colors.redAccent),
//                 ),
//               ],
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _navigateToDriverPage,
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 20),
//                   backgroundColor: Colors.orange,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   'Find Available Drivers',
//                   style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildShiftOption(
//       BuildContext context, {
//         required String title,
//         required String description,
//         required String imagePath,
//         required Color backgroundColor,
//         required VoidCallback onTap,
//       }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         color: Colors.white,
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//               child: Image.asset(
//                 imagePath,
//                 height: 150,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold, color: backgroundColor),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     description,
//                     style: GoogleFonts.lato(fontSize: 16, color: Colors.black54),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
