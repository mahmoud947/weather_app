import 'package:flutter/foundation.dart' show immutable;
import 'package:weather_app/features/weather/domain/models/weather.dart';

@immutable
abstract class HomeState {}

@immutable
class LoadingState implements HomeState {}

@immutable
class HomeErrorState implements HomeState {
  const HomeErrorState({required this.message});
  final String message;
}

class HomeSuccessfullyState implements HomeState {
  const HomeSuccessfullyState({required this.weather});
  final Weather weather;
}
