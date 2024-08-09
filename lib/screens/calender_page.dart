import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        title: Text("When do you want to rent?", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          // Quick selection buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceChip(label: Text('Tomorrow'), selected: false),
                ChoiceChip(label: Text('Fri - Sun'), selected: false),
                ChoiceChip(label: Text('A week starting Monday'), selected: false),
              ],
            ),
          ),
          Divider(),
          // Calendar widget (can use a package or custom implementation)
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('August 2024', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                _buildCalendarMonth(context),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('September 2024', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                _buildCalendarMonth(context),
              ],
            ),
          ),
          // Select Dates button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle date selection
                Navigator.pop(context);
              },
              child: Text('Select dates'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarMonth(BuildContext context) {
    // This is a placeholder for your calendar. You can use packages like table_calendar for full functionality.
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Table(
        children: [
          TableRow(children: [
            Text('S'),
            Text('M'),
            Text('T'),
            Text('W'),
            Text('T'),
            Text('F'),
            Text('S'),
          ]),
          TableRow(children: [
            Text(''),
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4'),
            Text('5'),
            Text('6'),
          ]),
          // Add more TableRows to represent each week in the month
        ],
      ),
    );
  }
}
