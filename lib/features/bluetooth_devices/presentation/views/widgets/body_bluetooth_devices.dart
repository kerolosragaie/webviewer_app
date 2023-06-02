import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/store/bluetooth_store.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/views/widgets/body_bluetooth_off.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/views/widgets/body_find_devices.dart';

class BluetoothDevicesBody extends StatelessWidget {
  const BluetoothDevicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bluetoothStore = getBluetoothStore(context);
    return StreamBuilder<BluetoothState>(
      stream: bluetoothStore.flutterBluePlus.state,
      initialData: BluetoothState.unknown,
      builder: (c, snapshot) {
        final state = bluetoothStore.state = snapshot.data;
        if (state == BluetoothState.off || state == BluetoothState.turningOff) {
          return const BluetoothOffBody();
        }
        return const FindDevicesBody();
      },
    );
  }
}
