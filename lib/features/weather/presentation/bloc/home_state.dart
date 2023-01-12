import 'package:flutter/foundation.dart' show immutable;
import 'package:weather_app/features/weather/domain/models/weather.dart';

@immutable
abstract class HomeState {}

@immutable
class LoadingState implements HomeState {}

@immutable
class ErrorState implements HomeState {
  const ErrorState({required this.message});
  final String message;
}

class SuccessfullyState implements HomeState {
  const SuccessfullyState({required this.weather});
  final Weather weather;
}
