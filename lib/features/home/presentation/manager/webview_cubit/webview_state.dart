part of 'webview_cubit.dart';

@immutable
abstract class WebviewState {}

class WebviewInitial extends WebviewState {}

class WebviewLoading extends WebviewState {}

class WebviewLoaded extends WebviewState {
  final WebViewController webViewController;
  WebviewLoaded({required this.webViewController});
}

class WebviewError extends WebviewState {
  final WebviewFailure error;
  WebviewError({required this.error});
}
