import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/core/utils/extensions.dart';
import 'package:weather_app/features/weather/domain/models/forecast_day.dart';
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecast/hourly_forecast_state.dart';
import 'package:weather_app/features/weather/presentation/widgets/buttom_sheet_base_card.dart';

import '../../../../widgets/hourly_forecast_card.dart';
import '../../../../widgets/perssure_widget.dart';
import '../../../../widgets/wind_widget.dart';

class HourlyForecastView extends StatelessWidget {
  const HourlyForecastView(
      {super.key,
      required this.controller,
      required this.forecastDay,
      required this.state,
      required this.onItemSelect});
  final ScrollController controller;
  final ForecastDay forecastDay;
  final Stream<HourlyForecastState> state;
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
            itemCount: forecastDay.hours.length,
            itemBuilder: (_, index) {
              final hour = forecastDay.hours[index];
              if (hour != null) {
                return StreamBuilder<HourlyForecastState>(
                    stream: state,
                    builder: (_, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      final state = snapshot.requireData;
                      if (state is HourlyForecastSuccessfullyState) {
                        return HourlyForecastCard(
                          isSelected: hour.time == state.hour?.time,
                          time: hour.time.orEmpty(),
                          temp: hour.temp.toString(),
                          iconUrl: hour.conditionDto.iconUrl,
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
        StreamBuilder<HourlyForecastState>(
            stream: state,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              final state = snapshot.requireData;
              if (state is HourlyForecastSuccessfullyState) {
                if (state.hour != null) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonSheetBaseCard(
                            content: '${state.hour?.feelsLike.orZero()}°',
                            leadingIconData: FontAwesomeIcons.temperatureFull,
                            leadingText: 'FEELS LIKE',
                            bottomText: 'Similar to the actual temperature',
                          ),
                          ButtonSheetBaseCard(
                            content:
                                '${state.hour?.visibility.orZero().toInt()} Km',
                            leadingIconData: Icons.visibility,
                            leadingText: 'VISIBILITY',
                            bottomText: 'Similar to the actual visibility',
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02 * size.height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WindWidget(
                            content: '${state.hour?.wind}',
                            leadingIconData: FontAwesomeIcons.temperatureFull,
                            leadingText: 'WIND',
                            unit: 'Km/h',
                          ),
                          ButtonSheetBaseCard(
                            content: '${state.hour?.humidity.orZero()} %',
                            leadingIconData: Icons.visibility,
                            leadingText: 'HUMIDITY',
                            bottomText: 'The dew point',
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02 * size.height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PressureWidget(
                            content: '${state.hour?.pressure}',
                            leadingIconData: FontAwesomeIcons.temperatureFull,
                            leadingText: 'PRESSURE',
                          ),
                          WindWidget(
                            content: state.hour!.windDir,
                            leadingIconData: Icons.visibility,
                            leadingText: 'WIND DIR',
                            unit: 'Dir',
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
