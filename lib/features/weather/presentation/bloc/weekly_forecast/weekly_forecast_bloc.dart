import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../../../domain/models/forecast_day.dart';
import '../home/home_bloc.dart';
import '../home/home_state.dart';
import 'weekly_forecast_event.dart';
import 'weekly_forecast_state.dart';

class WeeklyForecastBloc {
  WeeklyForecastBloc({
    required this.homeBloc,
  });
  final HomeBloc homeBloc;

  final BehaviorSubject<WeeklyForecastEvent> _event = BehaviorSubject();
  final BehaviorSubject<WeeklyForecastState> _state = BehaviorSubject();

  void start() {
    _event.add(const GetWeeklyForecast());
    homeBloc.state.listen((homeState) {
      if (homeState is HomeSuccessfullyState) {
        _event.distinct().listen((event) {
          if (event is GetWeeklyForecast) {
            _state.add(
              WeeklyForecastSuccessfullyState(
                day: event.date != null
                    ? homeState.weather.forecast.getDataOnDate(event.date!)
                    : homeState.weather.forecast.first,
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

  Sink<WeeklyForecastEvent> get event => _event;
  Stream<WeeklyForecastState> get state => _state;
}

extension GetHourlyWeatherDataFromTime on List<ForecastDay?> {
  ForecastDay? getDataOnDate(String time) {
    if (isNotEmpty) {
      return where((element) => element?.date == time).first;
    }
    return null;
  }
}
