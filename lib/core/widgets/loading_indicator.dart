import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:webviewer/core/utils/styles.dart';

class LoadingIndicators {
  static void ballSpinFadeLoaderDialog({required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 6,
                  child: const LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    colors: [
                      Color.fromRGBO(0, 138, 70, 1),
                      Color.fromRGBO(137, 199, 74, 1),
                      Colors.grey,
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Loading...',
                  style: Styles.textStyle26,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget ballSpinFadeLoader({required BuildContext context}) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.width / 5,
        width: MediaQuery.of(context).size.width / 5,
        child: const LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            Color.fromRGBO(0, 138, 70, 1),
            Color.fromRGBO(137, 199, 74, 1),
            Colors.grey,
          ],
        ),
      ),
    );
  }
}
