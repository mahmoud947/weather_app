import 'package:flutter/material.dart';

import '../features/weather/presentation/pages/home/home_page.dart';

class AppRoutes {
  AppRoutes._();
  static const String home = "/";
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return null;
    }
  }
}
