import 'package:flutter/foundation.dart' show immutable;
import '../../../domain/models/forecast_day.dart';

@immutable
abstract class WeeklyForecastState {}

@immutable
class WeeklyForecastErrorState implements WeeklyForecastState {
  const WeeklyForecastErrorState({required this.message});
  final String message;
}

@immutable
class WeeklyForecastSuccessfullyState implements WeeklyForecastState {
  const WeeklyForecastSuccessfullyState({required this.day});
  final ForecastDay? day;
}
