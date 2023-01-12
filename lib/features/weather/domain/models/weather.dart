import 'current.dart';
import 'forecast_day.dart';
import 'location.dart';

class Weather {
  Weather({
    required this.forecast,
    required this.current,
    required this.location,
  });
  final List<ForecastDay?> forecast;
  final Current current;
  final Location location;
}
