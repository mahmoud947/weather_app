import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/di/app_module.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_state.dart';
import '../../../../../../common/image_resources.dart';
import 'home_bottom_sheet.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late Stream<HomeState> state;
  late Sink<HomeEvent> event;

  @override
  void initState() {
    final HomeBloc block = ls<HomeBloc>();
    state = block.state;
    event = block.event;

    super.initState();
  }

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
          child: Text(
            'Montreal',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 15.h,
          left: 0,
          right: 0,
          child: Text(
            '19°',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 30.h,
          left: 0,
          right: 0,
          child: Text(
            'Mostly Clear',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 35.h,
          left: 0,
          right: 0,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                'H:24°',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'L:18°',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: 40.h,
          left: 0,
          right: 0,
          child: TextButton(
            onPressed: () {
              event.add(GetForecastEvent());
            },
            child: StreamBuilder<HomeState>(
                stream: state,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.requireData;
                    if (data is LoadingState) {
                      return const Text(
                        'Loading',
                      );
                    } else if (data is SuccessfullyState) {
                      return Text(
                        data.weather.currentDto.windDir,
                      );
                    } else if (data is ErrorState) {
                      return Text(data.message);
                    } else {
                      return Container();
                    }
                  } else {
                    return const Text(
                      'no data',
                    );
                  }
                }),
          ),
        ),
        const HomeButtonSheet(),
      ],
    );
  }
}
