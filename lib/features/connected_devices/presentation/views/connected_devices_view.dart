import 'package:flutter/material.dart';
import 'package:webviewer/features/connected_devices/presentation/views/widgets/app_bar_widget.dart';
import 'package:webviewer/features/connected_devices/presentation/views/widgets/body_connected_devices.dart';

class ConnectedDevicesView extends StatelessWidget {
  const ConnectedDevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(),
      body: ConnectedDevicesBody(),
    );
  }
}
