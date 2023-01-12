import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:weather_app/features/weather/domain/models/hour.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_state.dart';
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecast/hourly_forecast_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecast/hourly_forecast_state.dart';

class HourlyForecastBloc {
  HourlyForecastBloc({
    required this.homeBloc,
  });
  final HomeBloc homeBloc;

  final BehaviorSubject<HourlyForecastEvent> _event = BehaviorSubject();
  final BehaviorSubject<HourlyForecastState> _state = BehaviorSubject();

  void start() {
    _event.add(const GetHourlyForecast());
    homeBloc.state.listen((homeState) {
      if (homeState is HomeSuccessfullyState) {
        _event.distinct().listen((event) {
          if (event is GetHourlyForecast) {
            _state.add(
              HourlyForecastSuccessfullyState(
                hour: event.selectedTime != null
                    ? homeState.weather.forecast[0]?.hours
                        .getDataOnTime(event.selectedTime!)
                    : homeState.weather.forecast[0]?.hours[0],
              ),
            );
          }
        });
      }
    });
  }

  void dispose() {
    _event.close();
    _state.close();
  }

  Sink<HourlyForecastEvent> get event => _event;
  Stream<HourlyForecastState> get state => _state;
}

extension GetHourlyWeatherDataFromTime on List<Hour?> {
  Hour? getDataOnTime(String time) {
    if (isNotEmpty) {
      return where((element) => element?.time == time).first;
    }
    return null;
  }
}
