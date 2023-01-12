import 'package:flutter/foundation.dart' show immutable;

import 'package:weather_app/features/weather/domain/models/hour.dart';

@immutable
abstract class HourlyForecastState {}

@immutable
class HourlyForecastErrorState implements HourlyForecastState {
  const HourlyForecastErrorState({required this.message});
  final String message;
}

@immutable
class HourlyForecastSuccessfullyState implements HourlyForecastState {
  const HourlyForecastSuccessfullyState({required this.hour});
  final Hour? hour;
}
