import 'package:weather_app/features/weather/data/dto/weather_response_dto.dart';

abstract class WeatherService {
  Future<WeatherResponseDto> getForecast();
}
