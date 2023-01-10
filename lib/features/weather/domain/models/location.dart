import 'package:flutter/foundation.dart' show immutable;

@immutable
class Location {
  const Location({
    required this.name,
    required this.country,
    required this.region,
    required this.localTime,
  });
  final String name;
  final String country;
  final String region;
  final String localTime;
}
