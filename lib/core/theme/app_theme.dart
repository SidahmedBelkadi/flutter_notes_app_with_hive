import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.blue,
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  );
}
