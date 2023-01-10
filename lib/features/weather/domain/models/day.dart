// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' show immutable;

import 'condition.dart';

@immutable
class Day {
  const Day({
    required this.maxTemp,
    required this.minTemp,
    required this.maxWind,
    required this.avgVisibility,
    required this.avgHumidity,
    required this.condition,
  });
  final double maxTemp;
  final double minTemp;
  final double maxWind;

  final double avgVisibility;
  final double avgHumidity;
  final Condition condition;
}
