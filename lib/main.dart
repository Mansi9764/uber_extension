import 'package:flutter/material.dart';
import 'package:uber_final/screens/Login.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
MaterialApp(
  title: 'ChaufferX Login',
  theme: ThemeData(
    scaffoldBackgroundColor: Colors.white, // Ensures all screens have a white background by default
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.black, // Button text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black, // Text color for TextButtons
      ),
    ),
  ),
  home: LoginScreen(),
);
  }
}
