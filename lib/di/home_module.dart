import '../features/weather/data/data_sources/remote/weather_service.dart';
import '../features/weather/data/data_sources/remote/weather_service_impl.dart';
import '../features/weather/data/repositories/weather_repository_impl.dart';
import '../features/weather/domain/repositories/weather_repository.dart';
import '../features/weather/domain/usecases/get_forecast_use_case.dart';
import '../features/weather/presentation/bloc/home/home_bloc.dart';
import '../features/weather/presentation/bloc/hourly_forecast/hourly_forecast_bloc.dart';
import '../features/weather/presentation/bloc/weekly_forecast/weekly_forecast_bloc.dart';

import '../core/network/network_helper.dart';
import '../core/platform/network_connection_helper.dart';
import 'app_module.dart' show ls;

Future<void> initHomeModule() async {
//! Blocs
//? ...init HomeBloc
  ls.registerLazySingleton<HomeBloc>(
      () => HomeBloc(getForecastUseCase: ls<GetForecastUseCase>()));

  ls.registerLazySingleton<HourlyForecastBloc>(
      () => HourlyForecastBloc(homeBloc: ls<HomeBloc>()));

  ls.registerLazySingleton<WeeklyForecastBloc>(
      () => WeeklyForecastBloc(homeBloc: ls<HomeBloc>()));

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
