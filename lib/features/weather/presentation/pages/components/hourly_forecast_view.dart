import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/common/app_colors.dart';
import 'package:weather_app/features/weather/presentation/pages/components/hourly_forecast_card.dart';

class HourlyForecastView extends StatelessWidget {
  const HourlyForecastView({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: [
        SizedBox(
          height: 21.h,
          width: 100.w,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              HourlyForecastCard(
                iconUrl: '//cdn.weatherapi.com/weather/64x64/day/176.png',
                temp: '13',
                time: '12',
              ),
              HourlyForecastCard(
                iconUrl: '//cdn.weatherapi.com/weather/64x64/day/176.png',
                temp: '13',
                time: '12',
              ),
              HourlyForecastCard(
                iconUrl: '//cdn.weatherapi.com/weather/64x64/day/176.png',
                temp: '13',
                time: '12',
              ),
              HourlyForecastCard(
                iconUrl: '//cdn.weatherapi.com/weather/64x64/day/176.png',
                temp: '13',
                time: '12',
              ),
              HourlyForecastCard(
                iconUrl: '//cdn.weatherapi.com/weather/64x64/day/176.png',
                temp: '13',
                time: '12',
              ),
              HourlyForecastCard(
                iconUrl: '//cdn.weatherapi.com/weather/64x64/day/176.png',
                temp: '13',
                time: '12',
              ),
              HourlyForecastCard(
                iconUrl: '//cdn.weatherapi.com/weather/64x64/day/176.png',
                temp: '13',
                time: '12',
              ),
            ],
          ),
        )
      ],
    );
  }
}
