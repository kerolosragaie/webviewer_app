import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController();
    return WebViewWidget(
      controller: webViewController,
    );
  }
}
