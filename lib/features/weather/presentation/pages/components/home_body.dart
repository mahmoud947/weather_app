import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/weather/data/mappers/weather_dto_to_domain.dart';
import '../../../../../common/image_resources.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../core/presentation/dialog/generic_dialog.dart';
import '../../../data/dto/weather_response_dto.dart';
import 'home_bottom_sheet.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

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
            onPressed: () async {
              final NetworkHelper clint = NetworkHelperBuilder()
                  .setBaseUrl('http://api.weatherapi.com')
                  .addQueryInterceptor(
                      {'key': '2d1c06112751427d8b6164714221811'}).build();
              final response =
                  await clint.get(path: '/v1/forecast.json', queryParameters: {
                'q': 'London',
                'days': '7',
                'aqi': 'yes',
              });
              if (response.statusCode == 200) {
                print(
                  await response
                      .transform(utf8.decoder)
                      .join()
                      .then((json) =>
                          WeatherResponseDto.fromJson(json).toDomain())
                      .then((value) => value.forecast[0]!.hours[0]!.pressure),
                );
              }
            },
            child: Text(
              'Click me',
            ),
          ),
        ),
        const HomeButtonSheet(),
      ],
    );
  }
}
