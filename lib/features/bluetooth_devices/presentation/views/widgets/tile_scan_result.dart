import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:webviewer/core/utils/functions/bluetooth_handler.dart';
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
      //? Note: Unfortunately flutter_blue_plus was published from 11 days ago (from 6/5/2023)
      //? And found it is unstable, some time streaming bluetooth BluetoothDeviceState works and some times no :(
      trailing: StreamBuilder<BluetoothDeviceState>(
        stream: Stream.periodic(const Duration(seconds: 4))
            .asyncExpand((event) => result.device.state),
        initialData: BluetoothDeviceState.connecting,
        builder: (c, snapshot) {
          String text = "Connecting";
          text = _checkBluetoothState(snapshot, text);
          return Text(
            text,
            style: Styles.textStyle14,
          );
        },
      ),
      children: <Widget>[
        //To view devices information (power level, etc...)
        _buildAdvRow(
          context,
          'Tx Power Level',
          '${result.advertisementData.txPowerLevel ?? 'N/A'}',
        ),
        _buildAdvRow(
          context,
          'Manufacturer Data',
          BluetoothHandler.getNiceManufacturerData(
              result.advertisementData.manufacturerData),
        ),
        _buildAdvRow(
            context,
            'Service UUIDs',
            (result.advertisementData.serviceUuids.isNotEmpty)
                ? result.advertisementData.serviceUuids.join(', ').toUpperCase()
                : 'N/A'),
        _buildAdvRow(
          context,
          'Service Data',
          BluetoothHandler.getNiceServiceData(
              result.advertisementData.serviceData),
        ),
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

  String _checkBluetoothState(
      AsyncSnapshot<BluetoothDeviceState> snapshot, String text) {
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
    return text;
  }
}
