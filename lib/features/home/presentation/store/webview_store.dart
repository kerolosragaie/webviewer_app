import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:mobx/mobx.dart';

part 'webview_store.g.dart';

class WebviewStore = WebviewStoreBase with _$WebviewStore;

enum WebviewStoreState { loaded, error }

abstract class WebviewStoreBase with Store {
  WebviewStoreBase(BuildContext _);

  @observable
  WebviewStoreState webviewStoreState = WebviewStoreState.loaded;

  @observable
  WebViewController? controller;

  @observable
  WebView? webView;

  @observable
  String url = 'https://flutter.dev';

  @observable
  WebResourceError? errorMessage;

  @action
  void initWebview() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    webView = WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        controller = webViewController;
      },
      onWebResourceError: (error) {
        errorMessage = error;
        webviewStoreState = WebviewStoreState.error;
      },
      gestureNavigationEnabled: true,
      geolocationEnabled: false,
    );
  }

  @action
  void reloadUrl() {
    try {
      controller!
          .reload()
          .whenComplete(() => webviewStoreState = WebviewStoreState.loaded);
    } catch (e) {
      if (e is WebResourceError) {
        webviewStoreState = WebviewStoreState.error;
      }
      //Will load the cached site (data)
      webviewStoreState = WebviewStoreState.loaded;
    }
  }
}

WebviewStore getWebviewStore(BuildContext context) =>
    Provider.of<WebviewStore>(context, listen: false);
