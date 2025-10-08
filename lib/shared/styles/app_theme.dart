import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black87),
      ),
    );
  }

  // static ThemeData get darkTheme {
  //   return ThemeData(
  //     brightness: Brightness.dark,
  //     primarySwatch: Colors.blue,
  //     scaffoldBackgroundColor: Colors.black,
  //     appBarTheme: const AppBarTheme(
  //       backgroundColor: Colors.black,
  //       foregroundColor: Colors.white,
  //     ),
  //     textTheme: const TextTheme(
  //       bodyText1: TextStyle(color: Colors.white),
  //       bodyText2: TextStyle(color: Colors.white70),
  //     ),
  //   );
  // }
}