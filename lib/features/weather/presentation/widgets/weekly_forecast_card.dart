import 'package:flutter/material.dart';

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
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onClick(date);
      },
      child: SizedBox(
        height: 0.07 * size.height,
        width: 0.35 * size.width,
        child: Stack(
          children: [
            Positioned(
              height: 0.1 * size.height,
              top: 0.05 * size.height,
              left: 0,
              child: SizedBox(
                width: 0.3 * size.width,
                height: 0.1 * size.height,
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
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
