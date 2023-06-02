import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/store/bluetooth_store.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/views/widgets/app_bar_widget.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/views/widgets/body_bluetooth_devices.dart';

class BluetoothDevicesView extends StatelessWidget {
  const BluetoothDevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: const AppbarWidget(),
        body: const BluetoothDevicesBody(),
        floatingActionButton: _buildFloatingActionBttn(context),
      ),
    );
  }

  Widget _buildFloatingActionBttn(BuildContext context) {
    final bluetoothStore = getBluetoothStore(context);
    if (bluetoothStore.state == BluetoothState.on) {
      return StreamBuilder<bool>(
        stream: bluetoothStore.flutterBluePlus.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              onPressed: () => bluetoothStore.flutterBluePlus.stopScan(),
              backgroundColor: Colors.red,
              child: const Icon(Icons.stop),
            );
          } else {
            return FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () => bluetoothStore.flutterBluePlus.startScan(
                timeout: const Duration(seconds: 6),
              ),
            );
          }
        },
      );
    }
    return const SizedBox.shrink();
  }
}
