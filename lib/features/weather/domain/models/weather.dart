import 'current.dart';
import 'forecast_day.dart';
import 'location.dart';

class Weather {
  Weather({
    required this.forecast,
    required this.currentDto,
    required this.locationDto,
  });
  final List<ForecastDay?> forecast;
  final Current currentDto;
  final Location locationDto;
}
