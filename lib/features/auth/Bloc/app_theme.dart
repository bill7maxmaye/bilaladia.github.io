import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.blueAccent,
    textTheme: const TextTheme(
        headlineMedium:
            TextStyle(color: Colors.black), // Black text in light mode
        headlineSmall: TextStyle(color: Colors.black),
        labelSmall: TextStyle(color: Colors.black),
        labelMedium: TextStyle(color: Colors.black)),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: const TextStyle(color: Colors.grey),
      fillColor: Color.fromARGB(255, 194, 194, 194),
      prefixIconColor: Colors.black,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blueAccent,
      textTheme: ButtonTextTheme.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.black), // Black border in light mode
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white, // Button text color
        elevation: 5, // Button elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: Color.fromARGB(255, 54, 54, 54).withOpacity(0.1)),
          // Button corner radius
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    hintColor: Colors.blueAccent,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: Colors.white), // White text in dark mode
      headlineLarge: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: const TextStyle(color: Colors.grey),
      fillColor: Colors.white,
      prefixIconColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blueAccent,
      textTheme: ButtonTextTheme.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(
            color: Color.fromARGB(255, 79, 78, 78),
            width: 1.0), // White border in dark mode
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black, // Button text color
        elevation: 5, // Button elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Button corner radius
        ),
      ),
    ),
  );
}
