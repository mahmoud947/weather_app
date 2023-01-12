import 'dart:convert';

import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/network/network_helper.dart';
import 'package:weather_app/core/platform/network_connection_helper.dart';
import 'package:weather_app/features/weather/data/constants/remote_constants.dart';
import 'package:weather_app/features/weather/data/data_sources/remote/weather_service.dart';
import 'package:weather_app/features/weather/data/dto/weather_response_dto.dart';

class WeatherServiceImpl implements WeatherService {
  WeatherServiceImpl({
    required this.client,
    required this.networkInfoHelper,
  });

  final NetworkHelper client;
  final NetworkInfoHelper networkInfoHelper;
  @override
  Future<WeatherResponseDto> getForecast() async {
    final isConnected = await networkInfoHelper.isConnected;
    if (!isConnected) {
      throw const NoInternetConnection();
    }
    final request = await client.get(
      path: RemoteConstants.forecastEndPoint,
      queryParameters: {
        'q': 'Egypt',
        'days': '7',
        'aqi': 'yes',
      },
    );
    if (request.statusCode != 200) {
      throw getExceptionFromStatusCode(request.statusCode);
    }
    return await request
        .transform(utf8.decoder)
        .join()
        .then((jsonString) => WeatherResponseDto.fromJson(jsonString));
  }
}
