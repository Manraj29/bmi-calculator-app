import 'package:flutter/material.dart';
import 'package:bmi_calculator/BMIScreen.dart';
import 'package:bmi_calculator/NavBar.dart';
import 'package:bmi_calculator/AboutBMI.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool light = true; // State for light/dark mode

  // Function to toggle the light/dark mode
  void changeTheme() {
    setState(() {
      light = !light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Custom light theme settings
        brightness: Brightness.light,
        primaryColor: Colors.blue, // Primary color in light mode
        // backgroundColor: Colors.white, // Background color in light mode
        scaffoldBackgroundColor:
            Colors.blue[50], // Scaffold background color in light mode
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[700], // AppBar color in light mode
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontStyle: FontStyle.italic,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black,
              fontSize: 18,
          ), // Text color
          bodyMedium: TextStyle(
              color: Colors.black,
              fontSize: 16,
          ),
          bodySmall: TextStyle(
              color: Colors.black,
              fontSize: 14,
          ),
          titleSmall: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        iconTheme:
            IconThemeData(color: Colors.black), // Icon color in light mode
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue, // Button color
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      darkTheme: ThemeData(
        // Custom dark theme settings
        brightness: Brightness.dark,
        primaryColor: Colors.blue, // Primary color in dark mode
        // backgroundColor: Colors.black, // Background color in dark mode
        scaffoldBackgroundColor:
            Colors.blueGrey[900], // Scaffold background color in dark mode
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[700], // AppBar color in dark mode
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontStyle: FontStyle.italic,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ), // Text color
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        iconTheme:
            IconThemeData(color: Colors.white), // Icon color in dark mode
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple, // Button color
        ),
      ),


      themeMode: light
          ? ThemeMode.light
          : ThemeMode.dark, // Toggle between light and dark mode
      home: BMIScreen(changeTheme: changeTheme, light: light),
      routes: {
        '/about': (context) => AboutBMI(changeTheme: changeTheme, light: light),
      },
    );
  }
}
