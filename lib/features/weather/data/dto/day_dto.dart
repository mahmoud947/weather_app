// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

import 'condition_dto.dart';

@immutable
class DayDto {
  const DayDto({
    this.maxTemp,
    this.minTemp,
    this.maxWind,
    this.avgVisibility,
    this.avgHumidity,
    this.conditionDto,
  });
  final double? maxTemp;
  final double? minTemp;
  final double? maxWind;

  final double? avgVisibility;
  final double? avgHumidity;
  final ConditionDto? conditionDto;

  factory DayDto.fromMap(Map<String, dynamic> map) {
    return DayDto(
      maxTemp: map['maxtemp_c'],
      minTemp: map['mintemp_c'],
      maxWind: map['maxwind_kph'],
      avgVisibility: map['avgvis_km'],
      avgHumidity: map['avghumidity'],
      conditionDto: map['condition'] != null
          ? ConditionDto.fromMap(map['condition'] as Map<String, dynamic>)
          : null,
    );
  }

  factory DayDto.fromJson(String source) =>
      DayDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
