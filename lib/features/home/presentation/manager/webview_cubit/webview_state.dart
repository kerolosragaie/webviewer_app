part of 'webview_cubit.dart';

@immutable
abstract class WebviewState {}

class WebviewInitial extends WebviewState {}

class WebviewLoading extends WebviewState {}

class WebviewLoaded extends WebviewState {}

class WebviewError extends WebviewState {
  final WebResourceError error;
  WebviewError({required this.error});
}
