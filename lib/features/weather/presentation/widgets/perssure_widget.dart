import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/common/image_resources.dart';

import '../../../../../../../../common/app_colors.dart';

class PressureWidget extends StatelessWidget {
  const PressureWidget({
    Key? key,
    required this.leadingIconData,
    required this.leadingText,
    required this.content,
  }) : super(key: key);
  final IconData leadingIconData;
  final String leadingText;
  final String content;

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
            Icon(
              FontAwesomeIcons.circle,
              color: Colors.grey.shade400,
              size: 32.w,
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
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
