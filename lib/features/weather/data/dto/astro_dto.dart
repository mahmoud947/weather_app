// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class AstroDto {
  const AstroDto({
    this.sunRise,
    this.sunSet,
    this.moonRise,
    this.moonSet,
    this.moonPhase,
  });
  final String? sunRise;
  final String? sunSet;
  final String? moonRise;
  final String? moonSet;
  final String? moonPhase;

  factory AstroDto.fromMap(Map<String, dynamic> map) {
    return AstroDto(
      sunRise: map['sunrise'],
      sunSet: map['sunset'],
      moonRise: map['moonrise'],
      moonSet: map['moonset'],
      moonPhase: map['moon_phase'],
    );
  }

  factory AstroDto.fromJson(String source) =>
      AstroDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
