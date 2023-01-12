import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/app_colors.dart';

class ButtonSheetBaseCard extends StatelessWidget {
  const ButtonSheetBaseCard({
    Key? key,
    required this.leadingIconData,
    required this.leadingText,
    required this.content,
    required this.bottomText,
  }) : super(key: key);
  final IconData leadingIconData;
  final String leadingText;
  final String content;
  final String bottomText;
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
          Text(content),
          Divider(color: Colors.grey.shade400, thickness: 1.2),
          Text(
            bottomText,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.grey.shade400, fontSize: 14),
          )
        ],
      ),
    );
  }
}
