import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'bluetooth_store.g.dart';

///For faster development the snippet `store` or `mobstore` has been provided
///to create a basic store template in the current file, all you need to do is
///create a store file and type `mobstore` and press "Enter" and a store class
///based on the file name will be populated.
class BluetoothStore = BluetoothStoreBase with _$BluetoothStore;

abstract class BluetoothStoreBase with Store {
  BluetoothStoreBase(BuildContext _);

  @observable
  BluetoothState? state;

  @observable
  FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;
}

///The following helper function, to easily
///access the store using only the context, for the BluetoothStore example
BluetoothStore getBluetoothStore(BuildContext context) =>
    Provider.of<BluetoothStore>(context, listen: false);
