import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class WeeklyForecastEvent {}

@immutable
class GetWeeklyForecast implements WeeklyForecastEvent {
  const GetWeeklyForecast({this.date});
  final String? date;
}
