import 'package:go_router/go_router.dart';
import 'package:webviewer/core/utils/functions/custom_transition_animated_page.dart';
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
        pageBuilder: (context, state) =>
            CustomTransitionAnimatedPage.transitionScale(
          state: state,
          page: const ConnectedDevicesView(),
        ),
      ),
    ],
  );
}
