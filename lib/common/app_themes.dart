import 'package:flutter/material.dart';
import 'package:weather_app/common/app_colors.dart';

class AppThemes {
  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkIndigo,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkPurple,
      onPrimary: Colors.white,
      secondary: AppColors.darkPurple,
      onSecondary: Colors.grey,
      error: Colors.red,
      onError: Colors.white,
      background: AppColors.darkPurple,
      onBackground: Colors.white,
      surface: AppColors.darkBlue,
      onSurface: Colors.grey,
    ),
  );
}
