// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app/features/weather/data/dto/current_dto.dart';
import 'package:weather_app/features/weather/data/dto/forecast_day_dto.dart';
import 'package:weather_app/features/weather/data/dto/location_dto.dart';

class WeatherResponseDto {
  WeatherResponseDto({
    required this.forecast,
    required this.currentDto,
    required this.locationDto,
  });
  final List<ForecastDayDto> forecast;
  final CurrentDto currentDto;
  final LocationDto locationDto;

  factory WeatherResponseDto.fromMap(Map<String, dynamic> map) {
    List<ForecastDayDto> forecastDaysFromMap(Iterable<dynamic> maps) {
      return maps.map((map) => ForecastDayDto.fromMap(map)).toList();
    }

    return WeatherResponseDto(
      forecast: forecastDaysFromMap(map['forecast']['forecastday']),
      currentDto: CurrentDto.fromMap(map['current']),
      locationDto: LocationDto.fromMap(
        map['location'],
      ),
    );
  }

  factory WeatherResponseDto.fromJson(String source) =>
      WeatherResponseDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
