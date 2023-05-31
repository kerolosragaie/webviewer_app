import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'webview_state.dart';

class WebviewCubit extends Cubit<WebviewState> {
  final WebViewController webViewController;
  WebviewCubit({required this.webViewController}) : super(WebviewInitial());

  void initWebViewController({
    final String url = 'https://flutter.dev',
  }) {
    emit(WebviewLoading());
    Uri uri = Uri.parse(url);
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              emit(WebviewLoaded());
            }
          },
          onWebResourceError: (WebResourceError error) {
            emit(WebviewError(error: error));
            log('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onUrlChange: (UrlChange change) {
            emit(WebviewLoading());
          },
        ),
      )
      ..loadRequest(uri);
  }
}
