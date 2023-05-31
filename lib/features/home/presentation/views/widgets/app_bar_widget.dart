import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewer/core/utils/app_router.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Webviewer Screen"),
      actions: [
        IconButton(
          icon: const Icon(Icons.devices),
          onPressed: () {
            GoRouter.of(context).pushNamed(kConnectedDevicesView);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
