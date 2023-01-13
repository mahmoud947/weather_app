import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:weather_app/core/utils/extensions.dart';
import 'package:weather_app/features/weather/domain/models/forecast_day.dart';
import 'package:weather_app/features/weather/presentation/bloc/weekly_forecast/weekly_forecast_state.dart';

import '../../../../widgets/buttom_sheet_base_card.dart';
import '../../../../widgets/weekly_forecast_card.dart';
import '../../../../widgets/wind_widget.dart';

class WeeklyForecastView extends StatelessWidget {
  const WeeklyForecastView(
      {super.key,
      required this.controller,
      required this.forecastDay,
      required this.state,
      required this.onItemSelect});
  final ScrollController controller;
  final List<ForecastDay?> forecastDay;
  final Stream<WeeklyForecastState> state;
  final Function(String time) onItemSelect;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: [
        SizedBox(
          height: 0.21 * size.height,
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecastDay.length,
            itemBuilder: (_, index) {
              final currentForecastDay = forecastDay[index];
              if (currentForecastDay != null) {
                return StreamBuilder<WeeklyForecastState>(
                    stream: state,
                    builder: (_, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      final state = snapshot.requireData;
                      if (state is WeeklyForecastSuccessfullyState) {
                        return WeeklyForecastCard(
                          isSelected:
                              currentForecastDay.date == state.day?.date,
                          date: currentForecastDay.date,
                          temp: currentForecastDay.day.minTemp.toString(),
                          iconUrl: currentForecastDay.day.condition.iconUrl,
                          onClick: onItemSelect,
                        );
                      }

                      return Container();
                    });
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
        SizedBox(height: 0.04 * size.height),
        StreamBuilder<WeeklyForecastState>(
            stream: state,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              final state = snapshot.requireData;
              if (state is WeeklyForecastSuccessfullyState) {
                if (state.day != null) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonSheetBaseCard(
                            content: '${state.day?.day.maxTemp.orZero()}°',
                            leadingIconData: FontAwesomeIcons.temperatureFull,
                            leadingText: 'Max temp',
                            bottomText: 'max temperature',
                          ),
                          ButtonSheetBaseCard(
                            content: '${state.day?.day.minTemp.orZero()}°',
                            leadingIconData: FontAwesomeIcons.temperatureFull,
                            leadingText: 'Min temp',
                            bottomText: 'mini temperature',
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02 * size.height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WindWidget(
                            content: '${state.day?.day.maxWind.orZero()}',
                            leadingIconData: FontAwesomeIcons.wind,
                            leadingText: 'Max Wind',
                            unit: 'Km/h',
                          ),
                          ButtonSheetBaseCard(
                            content:
                                '${state.day?.day.avgVisibility.orZero()} Km',
                            leadingIconData: Icons.visibility,
                            leadingText: 'VISIBILITY',
                            bottomText: 'visibility',
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02 * size.height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonSheetBaseCard(
                            content: '${state.day?.day.avgHumidity.orZero()} %',
                            leadingIconData: Icons.dry_cleaning,
                            leadingText: 'HUMIDITY',
                            bottomText: 'The dew point',
                          ),
                          ButtonSheetBaseCard(
                            content: '${state.day?.day.condition.condition}',
                            leadingIconData: Icons.gesture_sharp,
                            leadingText: 'CONDITION',
                            bottomText:
                                'day may be ${state.day?.day.condition.condition}',
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02 * size.height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonSheetBaseCard(
                            content: '${state.day?.astro.sunSet}',
                            leadingIconData: Icons.sunny,
                            leadingText: 'SUNRISE',
                            bottomText: 'SunSet : ${state.day?.astro.sunSet}',
                          ),
                          ButtonSheetBaseCard(
                            content: '${state.day?.astro.moonRise}',
                            leadingIconData: FontAwesomeIcons.moon,
                            leadingText: 'MOONRISE',
                            bottomText: 'Moonset ${state.day?.astro.moonSet}',
                          ),
                        ],
                      ),
                      SizedBox(height: 0.04 * size.height),
                    ],
                  );
                }
              }
              return Container();
            })
      ],
    );
  }
}
