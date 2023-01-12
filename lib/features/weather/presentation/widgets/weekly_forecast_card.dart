import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/app_colors.dart';

class WeeklyForecastCard extends StatelessWidget {
  const WeeklyForecastCard({
    super.key,
    required this.date,
    required this.temp,
    required this.iconUrl,
    required this.isSelected,
    required this.onClick,
  });
  final String date;
  final String temp;
  final String iconUrl;
  final bool isSelected;
  final Function(String time) onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick(date);
      },
      child: SizedBox(
        height: 12.h,
        width: 40.w,
        child: Stack(
          children: [
            Positioned(
              height: 10.h,
              top: 5.h,
              left: 0,
              child: SizedBox(
                width: 30.w,
                height: 10.h,
                child: Card(
                  margin: const EdgeInsets.all(6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: AppColors.darkIndigo,
                      width: 0.2,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  color: isSelected ? AppColors.lavender : AppColors.indigo,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          date,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          '$temp°',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Image.network(
                iconUrl,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
