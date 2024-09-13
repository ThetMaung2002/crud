import 'package:flutter/material.dart';

class AppThemes {
  // Light theme inspired by Shein website
  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.black, // Primary text color
      secondary: Colors.pinkAccent, // Accent color
      surface: Colors.white, // Background for cards and containers
      onSurface: Colors.black, // Text color on surface
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 1,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
      headlineMedium: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      headlineSmall: TextStyle(color: Colors.black, fontSize: 18),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.pinkAccent, // Accent color for buttons
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: Colors.black12,
      elevation: 4,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pinkAccent, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  // Dark theme inspired by Shein website
  static final ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Colors.white, // Text color
      secondary: Colors.pinkAccent, // Accent color
      surface: Color(0xFF1E1E1E), // Card background
      onSurface: Colors.white, // Text color on surface
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 1,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
      headlineMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      headlineSmall: TextStyle(color: Colors.white, fontSize: 18),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.pinkAccent, // Accent color for buttons
      textTheme: ButtonTextTheme.primary,
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF1E1E1E),
      shadowColor: Colors.black26,
      elevation: 4,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.pinkAccent, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
