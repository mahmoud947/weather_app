import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTextTheme {
  AppTextTheme._();
  static final TextTheme appTextTheme = TextTheme(
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 30.sp, color: Colors.white),
    displayLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 96.sp),
    bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 24.sp),
    labelMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
  );
}
