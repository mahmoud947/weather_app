import 'package:flutter/material.dart';

import '../../../../common/image_resources.dart';

import '../../../../../../../../common/app_colors.dart';

class WindWidget extends StatelessWidget {
  const WindWidget({
    Key? key,
    required this.leadingIconData,
    required this.leadingText,
    required this.content,
    required this.unit,
  }) : super(key: key);
  final IconData leadingIconData;
  final String leadingText;
  final String content;
  final String unit;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 0.2 * size.height,
      width: 0.45 * size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.pink,
            AppColors.indigo,
            AppColors.darkBlue,
          ],
        ),
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
                leadingIconData,
                size: 15,
                color: Colors.grey.shade400,
              ),
              const SizedBox(width: 4),
              Text(
                leadingText,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.grey.shade400),
              ),
            ],
          ),
          Stack(children: [
            Image.asset(
              ImageResources.compass,
              color: Colors.grey.shade400,
              width: 0.32 * size.width,
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontSize: 14),
                  ),
                  Text(
                    unit,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontSize: 12),
                  ),
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
