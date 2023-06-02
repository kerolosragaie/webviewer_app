import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/store/bluetooth_store.dart';
import 'package:webviewer/features/bluetooth_devices/presentation/views/widgets/tile_scan_result.dart';

class FindDevicesBody extends StatelessWidget {
  const FindDevicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bluetoothStore = getBluetoothStore(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          StreamBuilder<List<ScanResult>>(
            stream: bluetoothStore.flutterBluePlus.scanResults,
            initialData: const [],
            builder: (c, snapshot) => Column(
              children: snapshot.data!
                  .map(
                    (r) => ScanResultTile(
                      result: r,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
