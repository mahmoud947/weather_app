import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  static const TextTheme appTextTheme = TextTheme(
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),
    displayLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 96),
    bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
    labelMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    labelSmall: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
  );
}
