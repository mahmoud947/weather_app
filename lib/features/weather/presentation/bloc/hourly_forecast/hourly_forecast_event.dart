import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class HourlyForecastEvent {}

@immutable
class GetHourlyForecast implements HourlyForecastEvent {
  const GetHourlyForecast({this.selectedTime});
  final String? selectedTime;
}
