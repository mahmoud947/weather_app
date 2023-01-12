import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/core/domain/data_state.dart';
import 'package:weather_app/core/presentation/loading/lodaing_screen.dart';
import 'package:weather_app/di/app_module.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_state.dart';

import 'components/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _bloc;
  StreamSubscription<HomeState>? _isLoading;

  @override
  void initState() {
    _bloc = ls<HomeBloc>();
    _bloc.event.add(GetForecastEvent());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    _isLoading?.cancel();
    super.dispose();
  }

  void setupLoadingScreen(BuildContext context) async {
    await _isLoading?.cancel();
    _isLoading = _bloc.state.listen(
      (event) {
        if (event is LoadingState) {
          LoadingScreen.instance.show(context: context, text: 'text');
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
        state: _bloc.state,
      ),
    );
  }
}
