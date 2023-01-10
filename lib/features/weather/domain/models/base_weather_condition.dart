import 'package:flutter/foundation.dart' show immutable;

import 'condition.dart';

@immutable
class BaseWeatherCondition {
  const BaseWeatherCondition({
    required this.temp,
    required this.conditionDto,
    required this.wind,
    required this.feelsLike,
    required this.windDir,
    required this.visibility,
    required this.humidity,
    required this.pressure,
  });
  final double temp;
  final double wind;
  final double feelsLike;
  final double visibility;
  final int humidity;
  final double pressure;
  final String windDir;
  final Condition conditionDto;
}
