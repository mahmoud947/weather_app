import 'package:flutter/foundation.dart' show immutable;

import 'base_weather_condition.dart';
import 'condition.dart';

@immutable
class Current extends BaseWeatherCondition {
  const Current({
    required double temp,
    required Condition condition,
    required double wind,
    required double feelsLike,
    required String windDir,
    required double visibility,
    required int humidity,
    required double pressure,
  }) : super(
          temp: temp,
          conditionDto: condition,
          feelsLike: feelsLike,
          humidity: humidity,
          pressure: pressure,
          visibility: visibility,
          wind: wind,
          windDir: windDir,
        );
}
