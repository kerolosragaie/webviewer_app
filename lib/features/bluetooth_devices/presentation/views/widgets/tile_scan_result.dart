import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:webviewer/core/utils/styles.dart';

class ScanResultTile extends StatelessWidget {
  final ScanResult result;
  const ScanResultTile({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: _buildTitle(context),
      leading: Text(
        result.rssi.toString(),
      ),
      trailing: StreamBuilder<BluetoothDeviceState>(
        stream: Stream.periodic(const Duration(seconds: 4))
            .asyncExpand((event) => result.device.state),
        initialData: BluetoothDeviceState.connecting,
        builder: (c, snapshot) {
          String text;
          switch (snapshot.data) {
            case BluetoothDeviceState.connected:
              text = 'Connected';
              break;
            case BluetoothDeviceState.disconnected:
              text = 'Disconnected';
              break;
            case BluetoothDeviceState.connecting:
              text = 'Connecting';
              break;
            case BluetoothDeviceState.disconnecting:
              text = 'Disconnecting';
              break;
            default:
              text = snapshot.data.toString().substring(21).toUpperCase();
              break;
          }
          return Text(
            text,
            style: Styles.textStyle14,
          );
        },
      ),
      children: <Widget>[
        _buildAdvRow(context, 'Tx Power Level',
            '${result.advertisementData.txPowerLevel ?? 'N/A'}'),
        _buildAdvRow(context, 'Manufacturer Data',
            getNiceManufacturerData(result.advertisementData.manufacturerData)),
        _buildAdvRow(
            context,
            'Service UUIDs',
            (result.advertisementData.serviceUuids.isNotEmpty)
                ? result.advertisementData.serviceUuids.join(', ').toUpperCase()
                : 'N/A'),
        _buildAdvRow(context, 'Service Data',
            getNiceServiceData(result.advertisementData.serviceData)),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (result.device.name.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            result.device.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            result.device.id.toString(),
            style: Styles.textStyle16,
          ),
        ],
      );
    } else {
      return Text(
        result.device.id.toString(),
      );
    }
  }

  Widget _buildAdvRow(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Styles.textStyle16,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              value,
              style: Styles.textStyle14,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  String getNiceManufacturerData(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(
          '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  String getNiceServiceData(Map<String, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add('${id.toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }
}
