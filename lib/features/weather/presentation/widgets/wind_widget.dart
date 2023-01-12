import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/common/image_resources.dart';

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
    return Container(
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
              width: 32.w,
            ),
            Positioned(
              top: 0.w,
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
                        ?.copyWith(fontSize: 14.sp),
                  ),
                  Text(
                    unit,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontSize: 12.sp),
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
