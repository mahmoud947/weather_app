import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/common/image_resources.dart';
import 'package:weather_app/core/presentation/dialog/generic_dialog.dart';
import 'package:weather_app/features/weather/presentation/pages/components/home_bottom_sheet.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            ImageResources.homeBackGround,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 50.h,
          right: 12.w,
          left: 12.w,
          child: Image.asset(
            ImageResources.homeIcon,
          ),
        ),
        Positioned(
          top: 10.h,
          left: 0,
          right: 0,
          child: Text(
            'Montreal',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 15.h,
          left: 0,
          right: 0,
          child: Text(
            '19°',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 30.h,
          left: 0,
          right: 0,
          child: Text(
            'Mostly Clear',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 35.h,
          left: 0,
          right: 0,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                'H:24°',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'L:18°',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
            top: 40.h,
            left: 0,
            right: 0,
            child: TextButton(
                onPressed: () {
                  showGenericDialog(
                    context: context,
                    title: 'title',
                    content: 'content',
                    optionBuilder: () => {'yes': 1, 'no': 0},
                    callBack: (result) {
                      print(result);
                    },
                  );
                },
                child: Text(
                  'Click me ',
                ))),
        const HomeButtonSheet(),
      ],
    );
  }
}
