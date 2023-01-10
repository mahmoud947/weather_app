import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;
import 'base_weather_condition_dto.dart';
import 'condition_dto.dart';

@immutable
class CurrentDto extends BaseWeatherConditionDto {
  const CurrentDto({
    double? temp,
    ConditionDto? conditionDto,
    double? wind,
    double? feelsLike,
    String? windDir,
    double? visibility,
    int? humidity,
    double? pressure,
  }) : super(
          temp: temp,
          conditionDto: conditionDto,
          feelsLike: feelsLike,
          humidity: humidity,
          pressure: pressure,
          visibility: visibility,
          wind: wind,
          windDir: windDir,
        );

  factory CurrentDto.fromMap(Map<String, dynamic> map) {
    return CurrentDto(
      temp: map['temp_c'],
      conditionDto: map['condition'] != null
          ? ConditionDto.fromMap(map['condition'] as Map<String, dynamic>)
          : null,
      wind: map['wind_kph'],
      feelsLike: map['feelslike_c'],
      windDir: map['wind_dir'],
      visibility: map['vis_km'],
      humidity: map['humidity'],
      pressure: map['pressure_in'],
    );
  }

  factory CurrentDto.fromJson(String source) =>
      CurrentDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
