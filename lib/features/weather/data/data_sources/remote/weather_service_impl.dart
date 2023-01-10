import 'dart:convert';

import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/network/network_helper.dart';
import 'package:weather_app/features/weather/data/constants/remote_constants.dart';
import 'package:weather_app/features/weather/data/data_sources/remote/weather_service.dart';
import 'package:weather_app/features/weather/data/dto/weather_response_dto.dart';

class WeatherServiceImpl implements WeatherService {
  WeatherServiceImpl({required this.client});

  final NetworkHelper client;

  @override
  Future<WeatherResponseDto> getForecast() async {
    final request = await client.get(
      path: RemoteConstants.forecastEndPoint,
      queryParameters: {
        'q': 'Egypt',
        'days': '7',
        'aqi': 'yes',
      },
    );
    if (request.statusCode != 200) {
      print(request.statusCode);
      throw getExceptionFromStatusCode(request.statusCode);
    }
    return await request
        .transform(utf8.decoder)
        .join()
        .then((jsonString) => WeatherResponseDto.fromJson(jsonString));
  }
}
