import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_state.dart';
import '../../../../../../common/image_resources.dart';
import 'home_bottom_sheet.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.state});
  final Stream<HomeState> state;

  @override
  Widget build(BuildContext context) {
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
          top: 50.h,
          right: 12.w,
          left: 12.w,
          child: Image.asset(
            ImageResources.homeIcon,
          ),
        ),
        Positioned(
          top: 10.h,
          left: 0,
          right: 0,
          child: StreamBuilder<HomeState>(
              stream: state,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  final currentState = snapshot.requireData;
                  if (currentState is SuccessfullyState) {
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
                        SizedBox(height: 2.h),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              'H:${currentState.weather.forecast[0]?.day.maxTemp}°',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 5.w,
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
        const HomeButtonSheet(),
      ],
    );
  }
}
