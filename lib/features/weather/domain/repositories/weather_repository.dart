import '../models/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getForecast();
}
