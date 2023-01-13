import '../data_sources/remote/weather_service.dart';
import '../mappers/weather_dto_to_domain.dart';
import '../../domain/models/weather.dart';
import '../../domain/repositories/weather_repository.dart';

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
