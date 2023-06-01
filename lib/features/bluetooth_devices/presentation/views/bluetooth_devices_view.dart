import 'package:flutter/material.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/views/widgets/app_bar_widget.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/views/widgets/body_bluetooth_devices.dart';

class BluetoothDevicesView extends StatelessWidget {
  const BluetoothDevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(),
      body: BluetoothDevicesBody(),
    );
  }
}
