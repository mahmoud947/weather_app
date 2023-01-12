import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/utils/extensions.dart';
import 'package:weather_app/features/weather/domain/models/forecast_day.dart';
import 'package:weather_app/features/weather/presentation/bloc/hourly_forecast/hourly_forecast_state.dart';
import 'package:weather_app/features/weather/presentation/bloc/weekly_forecast/weekly_forecast_state.dart';
import 'package:weather_app/features/weather/presentation/pages/home/components/hourly_forecast_view/widgets/perssure_widget.dart';
import 'package:weather_app/features/weather/presentation/pages/home/components/hourly_forecast_view/widgets/wind_widget.dart';
import 'package:weather_app/features/weather/presentation/widgets/buttom_sheet_base_card.dart';
import 'widgets/weekly_forecast_card.dart';

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
    return ListView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: [
        SizedBox(
          height: 21.h,
          width: 100.w,
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
        SizedBox(height: 4.h),
        // StreamBuilder<WeeklyForecastState>(
        //     stream: state,
        //     builder: (context, snapshot) {
        //       if (!snapshot.hasData) {
        //         return Container();
        //       }
        //       final state = snapshot.requireData;
        //       if (state is WeeklyForecastSuccessfullyState) {
        //         if (state.day != null) {
        //           return Column(
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 children: [
        //                   ButtonSheetBaseCard(
        //                     content: '${state.hour?.feelsLike.orZero()}°',
        //                     leadingIconData: FontAwesomeIcons.temperatureFull,
        //                     leadingText: 'FEELS LIKE',
        //                     bottomText: 'Similar to the actual temperature',
        //                   ),
        //                   ButtonSheetBaseCard(
        //                     content:
        //                         '${state.hour?.visibility.orZero().toInt()} Km',
        //                     leadingIconData: Icons.visibility,
        //                     leadingText: 'VISIBILITY',
        //                     bottomText: 'Similar to the actual visibility',
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: 2.h),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 children: [
        //                   WindWidget(
        //                     content: '${state.hour?.wind}',
        //                     leadingIconData: FontAwesomeIcons.temperatureFull,
        //                     leadingText: 'WIND',
        //                     unit: 'Km/h',
        //                   ),
        //                   ButtonSheetBaseCard(
        //                     content: '${state.hour?.humidity.orZero()} %',
        //                     leadingIconData: Icons.visibility,
        //                     leadingText: 'HUMIDITY',
        //                     bottomText: 'The dew point',
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: 2.h),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                 children: [
        //                   PressureWidget(
        //                     content: '${state.hour?.pressure}',
        //                     leadingIconData: FontAwesomeIcons.temperatureFull,
        //                     leadingText: 'PRESSURE',
        //                   ),
        //                   WindWidget(
        //                     content: state.hour!.windDir,
        //                     leadingIconData: Icons.visibility,
        //                     leadingText: 'WIND DIR',
        //                     unit: 'Dir',
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: 2.h),
        //             ],
        //           );
        //         }
        //       }
        //       return Container();
        //     })
      ],
    );
  }
}