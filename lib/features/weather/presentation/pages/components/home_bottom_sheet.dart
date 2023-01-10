import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../common/app_strings.dart';
import 'hourly_forecast_view.dart';

import '../../../../../common/app_colors.dart';

class HomeButtonSheet extends StatefulWidget {
  const HomeButtonSheet({super.key});

  @override
  State<HomeButtonSheet> createState() => _HomeButtonSheetState();
}

class _HomeButtonSheetState extends State<HomeButtonSheet>
    with TickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void deactivate() {
    _controller.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.pink.withAlpha(190),
              AppColors.indigo.withAlpha(190),
              AppColors.darkBlue.withAlpha(190),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          clipBehavior: Clip.antiAlias,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3,
              sigmaY: 3,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  TabBar(
                    controller: _controller,
                    tabs: const [
                      Tab(
                        child: Text(AppStrings.bottomSheetTab1),
                      ),
                      Tab(
                        child: Text(AppStrings.bottomSheetTab2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90.h,
                    width: 100.w,
                    child: TabBarView(
                      controller: _controller,
                      children: [
                        HourlyForecastView(controller: scrollController),
                        Container(
                          color: Colors.transparent,
                          child: const Center(
                            child: Text('Any'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
