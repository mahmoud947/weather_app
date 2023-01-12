// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/foundation.dart' show immutable;
import 'package:rxdart/rxdart.dart';
import 'package:weather_app/core/usecase/use_case_state.dart';

import 'package:weather_app/features/weather/domain/usecases/get_forecast_use_case.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_state.dart';

import '../../../domain/models/weather.dart';

@immutable
class HomeBloc {
  final GetForecastUseCase getForecastUseCase;
  HomeBloc({
    required this.getForecastUseCase,
  });

  final BehaviorSubject<HomeEvent> _event = BehaviorSubject<HomeEvent>();
  final BehaviorSubject<HomeState> _state = BehaviorSubject<HomeState>();

  void dispose() {
    _event.close();
    _state.close();
  }

  Sink<HomeEvent> get event => _event.sink;

  Stream<HomeState> get state => _event.stream.distinct().switchMap<HomeState>(
        (event) {
          return _onEvent(event: event);
        },
      );

  Stream<HomeState> _onEvent({required HomeEvent event}) {
    if (event is GetForecastEvent) {
      return _getForecast();
    } else {
      return Stream.value(const ErrorState(message: 'un known error'));
    }
  }

  Stream<HomeState> _getForecast() {
    return Rx.fromCallable<UseCaseState<Weather>>(() => getForecastUseCase())
        .map((state) {
      if (state is Right<Weather>) {
        return SuccessfullyState(weather: state.data);
      } else {
        return ErrorState(message: (state as Left<Weather>).failure.message);
      }
    }).startWith(LoadingState());
  }
}
