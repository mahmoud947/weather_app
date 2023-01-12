import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/weather/presentation/bloc/weekly_forecast/weekly_forecast_state.dart';
import 'package:weather_app/features/weather/presentation/pages/home/components/weekly_forecast_view/weekly_forecast_view.dart';
import '../../../../../../common/app_strings.dart';
import '../../../bloc/home/home_state.dart';
import '../../../bloc/hourly_forecast/hourly_forecast_state.dart';
import 'hourly_forecast_view/hourly_forecast_view.dart';

import '../../../../../../common/app_colors.dart';

class HomeButtonSheet extends StatefulWidget {
  const HomeButtonSheet({
    super.key,
    required this.homeState,
    required this.hourlyState,
    required this.onItemSelect,
    required this.weeklyState,
  });
  final Stream<HomeState> homeState;
  final Stream<HourlyForecastState> hourlyState;
  final Stream<WeeklyForecastState> weeklyState;
  final Function(String time) onItemSelect;

  @override
  State<HomeButtonSheet> createState() => _HomeButtonSheetState();
}

class _HomeButtonSheetState extends State<HomeButtonSheet>
    with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void deactivate() {
    _controller.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      builder: (_, scrollController) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.pink.withAlpha(190),
              AppColors.indigo.withAlpha(190),
              AppColors.darkBlue.withAlpha(190),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          clipBehavior: Clip.antiAlias,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  TabBar(
                    controller: _controller,
                    tabs: const [
                      Tab(
                        child: Text(AppStrings.bottomSheetTab1),
                      ),
                      Tab(
                        child: Text(AppStrings.bottomSheetTab2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90.h,
                    width: 100.w,
                    child: TabBarView(
                      controller: _controller,
                      children: [
                        StreamBuilder<HomeState>(
                          stream: widget.homeState,
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              final currentData = snapshot.requireData;
                              if (currentData is HomeSuccessfullyState) {
                                if (currentData.weather.forecast.isNotEmpty) {
                                  return HourlyForecastView(
                                    controller: scrollController,
                                    forecastDay:
                                        currentData.weather.forecast[0]!,
                                    onItemSelect: widget.onItemSelect,
                                    state: widget.hourlyState,
                                  );
                                }
                              }
                            }
                            return const SizedBox();
                          },
                        ),
                        StreamBuilder<HomeState>(
                          stream: widget.homeState,
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              final currentData = snapshot.requireData;
                              if (currentData is HomeSuccessfullyState) {
                                if (currentData.weather.forecast.isNotEmpty) {
                                  return WeeklyForecastView(
                                    controller: scrollController,
                                    forecastDay: currentData.weather.forecast,
                                    onItemSelect: widget.onItemSelect,
                                    state: widget.weeklyState,
                                  );
                                }
                              }
                            }
                            return const SizedBox();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
