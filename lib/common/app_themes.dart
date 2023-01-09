import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/common/app_colors.dart';
import 'package:weather_app/common/app_text_theme.dart';

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
        onBackground: Colors.grey,
        surface: AppColors.darkBlue,
        onSurface: Colors.grey,
      ),
      textTheme: AppTextTheme.appTextTheme,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.black.withOpacity(0),
      ),
      dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal,
          )));
}
