import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/common/app_routes.dart';
import 'package:weather_app/common/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppThemes.appTheme,
          themeMode: ThemeMode.system,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
