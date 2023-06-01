// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WebviewStore on WebviewStoreBase, Store {
  late final _$webviewStoreStateAtom =
      Atom(name: 'WebviewStoreBase.webviewStoreState', context: context);

  @override
  WebviewStoreState get webviewStoreState {
    _$webviewStoreStateAtom.reportRead();
    return super.webviewStoreState;
  }

  @override
  set webviewStoreState(WebviewStoreState value) {
    _$webviewStoreStateAtom.reportWrite(value, super.webviewStoreState, () {
      super.webviewStoreState = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: 'WebviewStoreBase.controller', context: context);

  @override
  WebViewController? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(WebViewController? value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$webViewAtom =
      Atom(name: 'WebviewStoreBase.webView', context: context);

  @override
  WebView? get webView {
    _$webViewAtom.reportRead();
    return super.webView;
  }

  @override
  set webView(WebView? value) {
    _$webViewAtom.reportWrite(value, super.webView, () {
      super.webView = value;
    });
  }

  late final _$urlAtom = Atom(name: 'WebviewStoreBase.url', context: context);

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'WebviewStoreBase.errorMessage', context: context);

  @override
  WebResourceError? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(WebResourceError? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$WebviewStoreBaseActionController =
      ActionController(name: 'WebviewStoreBase', context: context);

  @override
  void initWebview() {
    final _$actionInfo = _$WebviewStoreBaseActionController.startAction(
        name: 'WebviewStoreBase.initWebview');
    try {
      return super.initWebview();
    } finally {
      _$WebviewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reloadUrl() {
    final _$actionInfo = _$WebviewStoreBaseActionController.startAction(
        name: 'WebviewStoreBase.reloadUrl');
    try {
      return super.reloadUrl();
    } finally {
      _$WebviewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
webviewStoreState: ${webviewStoreState},
controller: ${controller},
webView: ${webView},
url: ${url},
errorMessage: ${errorMessage}
    ''';
  }
}
