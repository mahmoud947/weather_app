import 'package:flutter/foundation.dart' show immutable;

import 'condition_dto.dart';

@immutable
class BaseWeatherConditionDto {
  const BaseWeatherConditionDto({
    this.temp,
    this.conditionDto,
    this.wind,
    this.feelsLike,
    this.windDir,
    this.visibility,
    this.humidity,
    this.pressure,
  });
  final double? temp;
  final double? wind;
  final double? feelsLike;
  final double? visibility;
  final int? humidity;
  final double? pressure;
  final String? windDir;
  final ConditionDto? conditionDto;
}
