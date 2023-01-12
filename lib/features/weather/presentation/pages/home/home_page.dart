import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/core/domain/data_state.dart';
import 'package:weather_app/core/presentation/dialog/generic_dialog.dart';
import 'package:weather_app/core/presentation/loading/lodaing_screen.dart';
import 'package:weather_app/di/app_module.dart';

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
        } else if (event is ErrorState) {
          LoadingScreen.instance.hide();
          showGenericDialog(
            context: context,
            title: 'error',
            content: event.message,
            optionBuilder: {'retry': GetForecastEvent()},
            callBack: (event) {
              _bloc.event.add(event);
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
        state: _bloc.state,
      ),
    );
  }
}
