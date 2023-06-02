import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:webviewer/core/utils/errors/webview_failure.dart';
import 'package:webviewer/core/widgets/custom_error.dart';
import 'package:webviewer/core/widgets/loading_indicator.dart';
import 'package:webviewer/features/home/presentation/store/webview_store.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final webviewStore = getWebviewStore(context);
    return Observer(
      builder: (_) {
        if (webviewStore.webviewStoreState == WebviewStoreState.loaded) {
          return webviewStore.webView!;
        } else if (webviewStore.webviewStoreState == WebviewStoreState.error) {
          return CustomErrorWidget(
            errorMessage:
                WebviewFailure.fromWebViewError(webviewStore.errorMessage!)
                    .message,
          );
        }
        return LoadingIndicators.ballSpinFadeLoader(context: context);
      },
    );
  }
}
