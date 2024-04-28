import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

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
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.black),
  );
}
