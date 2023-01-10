import 'dart:convert';
import '../../data/dto/base_weather_condition_dto.dart';

import 'base_weather_condition.dart';
import 'condition.dart';

class Hour extends BaseWeatherCondition {
  const Hour({
    required this.time,
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

  final String? time;
}
