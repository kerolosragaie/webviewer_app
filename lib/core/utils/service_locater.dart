import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocater() async {
  //? core

  //? External
  sl.registerLazySingleton<WebViewController>(() => WebViewController());
}
