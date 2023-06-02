import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'bluetooth_store.g.dart';

class BluetoothStore = BluetoothStoreBase with _$BluetoothStore;

abstract class BluetoothStoreBase with Store {
  BluetoothStoreBase(BuildContext _);

  @observable
  BluetoothState? state;

  @observable
  FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;
}

BluetoothStore getBluetoothStore(BuildContext context) =>
    Provider.of<BluetoothStore>(context, listen: false);
