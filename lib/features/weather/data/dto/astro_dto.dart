// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class AstroDto {
  const AstroDto({
    required this.sunRise,
    required this.sunSet,
    required this.moonRise,
    required this.moonSet,
    required this.moonPhase,
  });
  final String sunRise;
  final String sunSet;
  final String moonRise;
  final String moonSet;
  final String moonPhase;

  factory AstroDto.fromMap(Map<String, dynamic> map) {
    return AstroDto(
      sunRise: map['sunrise'] as String,
      sunSet: map['sunset'] as String,
      moonRise: map['moonrise'] as String,
      moonSet: map['moonset'] as String,
      moonPhase: map['moon_phase'] as String,
    );
  }

  factory AstroDto.fromJson(String source) =>
      AstroDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
