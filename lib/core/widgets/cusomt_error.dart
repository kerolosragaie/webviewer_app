import 'package:flutter/material.dart';
import 'package:webviewer/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? title;
  final String errorMessage;
  const CustomErrorWidget({
    Key? key,
    required this.errorMessage,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mQWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            color: Colors.red,
            size: mQWidth * 0.03,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? "ERROR!",
                  textAlign: TextAlign.center,
                  style: Styles.textStyle20.copyWith(color: Colors.red),
                ),
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
