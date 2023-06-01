import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewer/core/utils/app_router.dart';
import 'package:webviewer/features/home/presentation/manager/webview_cubit/webview_cubit.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Webviewer Screen"),
      actions: [
        IconButton(
          icon: const Icon(Icons.restart_alt),
          onPressed: () {
            BlocProvider.of<WebviewCubit>(context).reloadUrl();
          },
        ),
        IconButton(
          icon: const Icon(Icons.devices),
          onPressed: () {
            GoRouter.of(context).push(kConnectedDevicesView);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
