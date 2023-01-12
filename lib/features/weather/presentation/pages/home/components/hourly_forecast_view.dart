import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/common/app_colors.dart';
import 'package:weather_app/core/utils/extensions.dart';
import 'package:weather_app/features/weather/domain/models/forecast_day.dart';
import 'hourly_forecast_card.dart';

class HourlyForecastView extends StatelessWidget {
  const HourlyForecastView(
      {super.key, required this.controller, required this.forecastDay});
  final ScrollController controller;
  final ForecastDay forecastDay;
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
            itemCount: forecastDay.hours.length,
            itemBuilder: (_, index) {
              final hour = forecastDay.hours[index];
              if (hour != null) {
                return HourlyForecastCard(
                    isSelected: false,
                    time: hour.time.orEmpty(),
                    temp: hour.temp.toString(),
                    iconUrl: hour.conditionDto.iconUrl);
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 20.h,
              width: 45.w,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'SUNRISE',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                  const Text('5:50 AM'),
                  const Icon(Icons.sunny_snowing),
                  Divider(color: Colors.grey.shade400, thickness: 1.2),
                  Text(
                    'sunset 7:25PM',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
            Container(
              height: 20.h,
              width: 45.w,
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.sunny),
                      Text('SUNRISE'),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
