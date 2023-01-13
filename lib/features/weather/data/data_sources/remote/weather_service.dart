import '../../dto/weather_response_dto.dart';

abstract class WeatherService {
  Future<WeatherResponseDto> getForecast();
}
