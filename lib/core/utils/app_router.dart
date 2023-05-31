import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewer/features/connected_devices/presentation/connected_devices_view.dart';
import 'package:webviewer/features/home/presentation/home_view.dart';

// Routes names
const kHomeView = '/';
const kConnectedDevicesView = '/ConnectedDevicesView';

abstract class AppRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kConnectedDevicesView,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          transitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const ConnectedDevicesView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              ScaleTransition(scale: animation, child: child),
        ),
      ),
    ],
  );
}
