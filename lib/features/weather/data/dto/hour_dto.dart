import 'dart:convert';

import 'base_weather_condition_dto.dart';
import 'condition_dto.dart';

class HourDto extends BaseWeatherConditionDto {
  const HourDto({
    this.time,
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

  final String? time;

  factory HourDto.fromMap(Map<String, dynamic> map) {
    return HourDto(
      time: map['time'],
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

  factory HourDto.fromJson(String source) =>
      HourDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
