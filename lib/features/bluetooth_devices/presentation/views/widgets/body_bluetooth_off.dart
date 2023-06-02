import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:webviewer/core/utils/styles.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/store/bluetooth_store.dart';

class BluetoothOffBody extends StatelessWidget {
  const BluetoothOffBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bluetoothStore = getBluetoothStore(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.bluetooth_disabled,
            size: 200.0,
            color: Colors.white54,
          ),
          const SizedBox(height: 20),
          Text(
            'Bluetooth Adapter is ${_getBluetoothState(bluetoothStore)}.',
            style: Styles.textStyle16,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _turnOnBluetooth(bluetoothStore.flutterBluePlus),
            child: const Text('TURN ON'),
          ),
        ],
      ),
    );
  }

  String _getBluetoothState(BluetoothStore bluetoothStore) =>
      bluetoothStore.state != null
          ? bluetoothStore.state.toString().substring(15)
          : 'not available';

  void _turnOnBluetooth(FlutterBluePlus flutterBluePlus) {
    if (Platform.isAndroid) flutterBluePlus.turnOn();
  }
}
