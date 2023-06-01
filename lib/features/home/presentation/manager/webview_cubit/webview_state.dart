part of 'webview_cubit.dart';

@immutable
abstract class WebviewState {}

class WebviewInitial extends WebviewState {}

class WebviewLoading extends WebviewState {}

class WebviewLoaded extends WebviewState {
  final WebView webView;
  WebviewLoaded({required this.webView});
}

class WebviewError extends WebviewState {
  final WebviewFailure error;
  WebviewError({required this.error});
}
