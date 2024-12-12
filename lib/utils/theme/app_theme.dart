import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Color(0xff254F1A),
      onSurface: Colors.white,
      primary: Color(0xffE9C0E9),
      onPrimary: Color(0xffD2E823),
    ),
  );
}
