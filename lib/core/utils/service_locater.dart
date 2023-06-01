import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocater() async {
  //? core

  //? External
  // sl.registerLazySingleton<WebViewController>(
  //     () => WebViewController.fromPlatformCreationParams(sl()));

  // sl.registerLazySingleton<PlatformWebViewControllerCreationParams>(
  //     () => (WebViewPlatform.instance is WebKitWebViewPlatform)
  //         ? WebKitWebViewControllerCreationParams(
  //             allowsInlineMediaPlayback: true,
  //             mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
  //           )
  //         : const PlatformWebViewControllerCreationParams());
}
