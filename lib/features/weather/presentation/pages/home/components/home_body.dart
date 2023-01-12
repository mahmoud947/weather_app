import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/domain/data_state.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/platform/network_connection_helper.dart';
import 'package:weather_app/core/usecase/base_use_case.dart';
import 'package:weather_app/features/weather/data/data_sources/remote/weather_service.dart';
import 'package:weather_app/features/weather/data/data_sources/remote/weather_service_impl.dart';
import 'package:weather_app/features/weather/data/mappers/weather_dto_to_domain.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/features/weather/domain/models/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_forecast_use_case.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/home_state.dart';
import '../../../../../../common/image_resources.dart';
import '../../../../../../core/network/network_helper.dart';
import '../../../../../../core/presentation/dialog/generic_dialog.dart';
import '../../../../data/dto/weather_response_dto.dart';
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
    final NetworkHelper client = NetworkHelperBuilder()
        .setBaseUrl('http://api.weatherapi.com')
        .addQueryInterceptor(
            {'key': '2d1c06112751427d8b6164714221811'}).build();
    final WeatherService service = WeatherServiceImpl(
        client: client, networkInfoHelper: NetworkInfoHelperImpl());
    final WeatherRepository repository =
        WeatherRepositoryImpl(weatherService: service);
    final usecase = GetForecastUseCase(repository: repository);
    final block = HomeBloc(getForecastUseCase: usecase);
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
