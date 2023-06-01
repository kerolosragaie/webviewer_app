import 'dart:developer';

import 'package:flutter_webview_pro/platform_interface.dart';
import 'package:webviewer/core/utils/errors/failures.dart';

class WebviewFailure extends Failure {
  WebviewFailure(super.message);

  factory WebviewFailure.fromWebViewError(WebResourceError error) {
    log('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
          ''');
    switch (error.errorType) {
      case WebResourceErrorType.badUrl:
        return WebviewFailure("Malformed URL.");
      case WebResourceErrorType.authentication:
        return WebviewFailure("User authentication failed on server.");
      case WebResourceErrorType.connect:
        return WebviewFailure("Failed to connect to the server.");
      case WebResourceErrorType.failedSslHandshake:
        return WebviewFailure("Failed to perform SSL handshake.");
      case WebResourceErrorType.hostLookup:
        return WebviewFailure("Server or proxy hostname lookup failed.");
      case WebResourceErrorType.unknown:
        return WebviewFailure("Generic error!");
      case WebResourceErrorType.tooManyRequests:
        return WebviewFailure("Too many requests during this load.");
      case WebResourceErrorType.timeout:
        return WebviewFailure("Connection timed out.");
      case WebResourceErrorType.javaScriptExceptionOccurred:
        return WebviewFailure("A JavaScript exception occurred.");
      case WebResourceErrorType.unsafeResource:
        return WebviewFailure("Resource load was canceled by Safe Browsing.");
      case WebResourceErrorType.proxyAuthentication:
        return WebviewFailure("User authentication failed on proxy.");
      case WebResourceErrorType.webContentProcessTerminated:
        return WebviewFailure("The web content process was terminated.");
      case WebResourceErrorType.webViewInvalidated:
        return WebviewFailure("The web view was invalidated.");
      default:
        return WebviewFailure("Opps, unkown error, please try again later!");
    }
  }
}
