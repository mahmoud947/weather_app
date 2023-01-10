import 'package:flutter/foundation.dart' show immutable;

@immutable
class Astro {
  const Astro({
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
}
