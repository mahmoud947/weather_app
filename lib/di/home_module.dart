import 'package:weather_app/features/weather/data/data_sources/remote/weather_service.dart';
import 'package:weather_app/features/weather/data/data_sources/remote/weather_service_impl.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_forecast_use_case.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_bloc.dart';

import '../core/network/network_helper.dart';
import '../core/platform/network_connection_helper.dart';
import 'app_module.dart' show ls;

Future<void> initHomeModule() async {
//! Blocs
//? ...init HomeBloc
  ls.registerFactory<HomeBloc>(
      () => HomeBloc(getForecastUseCase: ls<GetForecastUseCase>()));

//! UseCases
//? ...init getForecastUseCase
  ls.registerFactory<GetForecastUseCase>(
      () => GetForecastUseCase(repository: ls<WeatherRepository>()));

//! Repository
//? ...init weather repository
  ls.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherService: ls<WeatherService>()));

//! DataSources
//? ...init remote data source
  ls.registerLazySingleton<WeatherService>(
    () => WeatherServiceImpl(
      client: ls<NetworkHelper>(),
      networkInfoHelper: ls<NetworkInfoHelper>(),
    ),
  );
}
