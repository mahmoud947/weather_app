import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class LocationDto {
  const LocationDto({
    this.name,
    this.country,
    this.region,
    this.localTime,
  });
  final String? name;
  final String? country;
  final String? region;
  final String? localTime;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'country': country,
      'region': region,
      'localTime': localTime,
    };
  }

  factory LocationDto.fromMap(Map<String, dynamic> map) {
    return LocationDto(
      name: map['name'],
      country: map['country'],
      region: map['region'],
      localTime: map['localtime'],
    );
  }

  factory LocationDto.fromJson(String source) =>
      LocationDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
