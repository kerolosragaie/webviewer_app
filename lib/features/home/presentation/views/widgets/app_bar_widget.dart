import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewer/core/utils/app_router.dart';
import 'package:webviewer/features/home/presentation/store/webview_store.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final webviewStore = getWebviewStore(context);
    return AppBar(
      title: const Text("Webviewer Screen"),
      actions: [
        IconButton(
          icon: const Icon(Icons.restart_alt),
          onPressed: () {
            webviewStore.reloadUrl();
          },
        ),
        IconButton(
          icon: const Icon(Icons.devices),
          onPressed: () {
            GoRouter.of(context).push(kBluetoothDevicesView);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
