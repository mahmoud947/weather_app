import 'package:weather_app/features/weather/domain/models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getForecast();
}
