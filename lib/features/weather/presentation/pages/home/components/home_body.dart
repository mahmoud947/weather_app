import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/bloc/home/home_state.dart';
import '../../../../../../common/image_resources.dart';
import '../../../bloc/hourly_forecast/hourly_forecast_state.dart';
import '../../../bloc/weekly_forecast/weekly_forecast_state.dart';
import 'home_bottom_sheet.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.state,
    required this.hourlyState,
    required this.onHourSelect,
    required this.weeklyState,
    required this.onDaySelect,
  });
  final Stream<HomeState> state;
  final Stream<HourlyForecastState> hourlyState;
  final Stream<WeeklyForecastState> weeklyState;
  final Function(String time) onHourSelect;
  final Function(String time) onDaySelect;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            ImageResources.homeBackGround,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 0.5 * size.height,
          right: 0.12 * size.width,
          left: 0.12 * size.width,
          child: Image.asset(
            ImageResources.homeIcon,
          ),
        ),
        Positioned(
          top: 0.1 * size.height,
          left: 0,
          right: 0,
          child: StreamBuilder<HomeState>(
              stream: state,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  final currentState = snapshot.requireData;
                  if (currentState is HomeSuccessfullyState) {
                    return Column(
                      children: [
                        Text(
                          currentState.weather.location.country,
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${currentState.weather.current.temp.toInt()}°',
                          style: Theme.of(context).textTheme.displayLarge,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          currentState.weather.location.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * size.height),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              'H:${currentState.weather.forecast[0]?.day.maxTemp}°',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 0.05 * size.height,
                            ),
                            Text(
                              'L:${currentState.weather.forecast[0]?.day.minTemp}°',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (currentState is LoadingState) {
                    return Container();
                  } else {
                    return Container();
                  }
                } else {
                  return Text('data');
                }
              }),
        ),
        HomeButtonSheet(
          homeState: state,
          hourlyState: hourlyState,
          weeklyState: weeklyState,
          onHourSelect: onHourSelect,
          onDaySelect: onDaySelect,
        ),
      ],
    );
  }
}
