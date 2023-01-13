import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            Icon(
              FontAwesomeIcons.circle,
              color: Colors.grey.shade400,
              size: 0.32 * size.width,
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
                ],
              ),
            )
          ]),
        ],
      ),
    );
  }
}
