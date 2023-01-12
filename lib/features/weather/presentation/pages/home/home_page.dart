import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/dialog/generic_dialog.dart';
import 'package:weather_app/core/presentation/loading/lodaing_screen.dart';
import 'package:weather_app/di/app_module.dart';
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecast/hourly_forecast_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecast/hourly_forecast_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/weekly_forecast/weekly_forecast_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weekly_forecast/weekly_forecast_event.dart';

import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_event.dart';
import '../../bloc/home/home_state.dart';
import 'components/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  late HourlyForecastBloc _hourlyForecastBloc;
  late WeeklyForecastBloc _weeklyForecastBloc;
  StreamSubscription<HomeState>? _isLoading;

  @override
  void initState() {
    _homeBloc = ls<HomeBloc>();
    _hourlyForecastBloc = ls<HourlyForecastBloc>();
    _weeklyForecastBloc = ls<WeeklyForecastBloc>();

    _homeBloc.event.add(GetForecastEvent());
    _hourlyForecastBloc.start();
    _weeklyForecastBloc.start();
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    _hourlyForecastBloc.dispose();
    _weeklyForecastBloc.dispose();
    _isLoading?.cancel();
    super.dispose();
  }

  void setupLoadingScreen(BuildContext context) async {
    await _isLoading?.cancel();
    _isLoading = _homeBloc.state.listen(
      (event) {
        if (event is LoadingState) {
          LoadingScreen.instance.show(context: context, text: 'text');
        } else if (event is HomeErrorState) {
          LoadingScreen.instance.hide();
          showGenericDialog(
            context: context,
            title: 'error',
            content: event.message,
            optionBuilder: {'retry': GetForecastEvent()},
            callBack: (event) {
              _homeBloc.event.add(event);
            },
          );
        } else {
          LoadingScreen.instance.hide();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setupLoadingScreen(context);
    return Scaffold(
      body: HomeBody(
        state: _homeBloc.state,
        hourlyState: _hourlyForecastBloc.state,
        weeklyState: _weeklyForecastBloc.state,
        onHourSelect: (time) {
          _hourlyForecastBloc.event.add(GetHourlyForecast(selectedTime: time));
        },
        onDaySelect: (time) {
          _weeklyForecastBloc.event.add(GetWeeklyForecast(date: time));
        },
      ),
    );
  }
}
