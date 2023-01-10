import 'package:weather_app/features/weather/data/data_sources/remote/weather_service.dart';
import 'package:weather_app/features/weather/data/mappers/weather_dto_to_domain.dart';
import 'package:weather_app/features/weather/domain/models/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({required this.weatherService});
  final WeatherService weatherService;
  @override
  Future<Weather> getForecast() async {
    return await weatherService
        .getForecast()
        .then((weatherResponse) => weatherResponse.toDomain());
  }
}
