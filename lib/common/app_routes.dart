import 'package:flutter/material.dart';
import '../di/app_module.dart';
import '../di/home_module.dart';

import '../features/weather/presentation/pages/home/home_page.dart';

class AppRoutes {
  AppRoutes._();
  static const String home = "/";
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        initAppModule();
        initHomeModule();
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return null;
    }
  }
}
