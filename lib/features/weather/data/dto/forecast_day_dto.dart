// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app/features/weather/data/dto/astro_dto.dart';
import 'package:weather_app/features/weather/data/dto/hour_dto.dart';

import 'day_dto.dart';

class ForecastDayDto {
  ForecastDayDto({
    this.date,
    this.day,
    this.astro,
    this.hours,
  });
  final String? date;
  final DayDto? day;
  final AstroDto? astro;
  final List<HourDto?>? hours;

  factory ForecastDayDto.fromMap(Map<String, dynamic> map) {
    List<HourDto> hoursFromMap(Iterable<dynamic> maps) {
      return maps.map((map) => HourDto.fromMap(map)).toList();
    }

    return ForecastDayDto(
      date: map['date'],
      day: DayDto.fromMap(map['day'] as Map<String, dynamic>),
      astro: AstroDto.fromMap(map['astro'] as Map<String, dynamic>),
      hours: hoursFromMap(map['hour']).toList(),
    );
  }

  factory ForecastDayDto.fromJson(String source) =>
      ForecastDayDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
