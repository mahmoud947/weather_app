import 'package:flutter/material.dart';

import '../../../../../../common/app_colors.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({
    super.key,
    required this.time,
    required this.temp,
    required this.iconUrl,
    required this.isSelected,
  });
  final String time;
  final String temp;
  final String iconUrl;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 4,
            ),
            Text(
              time,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Image.network(
              iconUrl,
              width: 50,
            ),
            Text(
              '$temp°',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
