import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:webviewer/core/utils/errors/webview_failure.dart';

part 'webview_state.dart';

class WebviewCubit extends Cubit<WebviewState> {
  WebViewController? controller;
  late final WebView webView;
  WebviewCubit() : super(WebviewInitial());

  void initWebView({final String url = 'https://flutter.dev'}) {
    emit(WebviewLoading());
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    webView = WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        controller = webViewController;
      },
      onProgress: (int progress) {
        log("Progress $progress %");
      },
      gestureNavigationEnabled: true,
      geolocationEnabled: false,
    );
    emit(WebviewLoaded(webView: webView));
  }

  void reloadUrl() {
    emit(WebviewLoading());
    controller!
      ..clearCache()
      ..reload().whenComplete(() => emit(WebviewLoaded(webView: webView)));
  }

  void changeUrl({required String url}) {
    emit(WebviewLoading());
    controller!
      ..clearCache()
      ..loadUrl(url).whenComplete(() => emit(WebviewLoaded(webView: webView)));
  }
}
