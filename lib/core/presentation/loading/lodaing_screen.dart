import 'dart:async';

import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import 'loading_screen_controller.dart';

class LoadingScreen {
  // lazy singleton pattern
  LoadingScreen._();
  static LoadingScreen? _instance;
  static LoadingScreen get instance {
    _instance ??= LoadingScreen._();
    return _instance!;
  }

  LoadingScreenController? controller;

  void show({
    required BuildContext context,
    required String text,
  }) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = _showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController _showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final textChange = StreamController<String>();
    textChange.add(text);

    final size = MediaQuery.of(context).size;

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
                //make sure at least we have half of screen width
                minWidth: size.width * 0.5,
                maxHeight: size.height * 0.8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<String>(
                        stream: textChange.stream,
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.requireData,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.darkIndigo,
                                    fontSize: 14,
                                  ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    //display overlay
    final state = Overlay.of(context);
    state?.insert(overlay);

    return LoadingScreenController(
      close: () {
        textChange.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        textChange.add(text);
        return true;
      },
    );
  }
}
