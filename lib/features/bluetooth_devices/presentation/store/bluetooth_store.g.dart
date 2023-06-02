// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BluetoothStore on BluetoothStoreBase, Store {
  late final _$stateAtom =
      Atom(name: 'BluetoothStoreBase.state', context: context);

  @override
  BluetoothState? get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(BluetoothState? value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$flutterBluePlusAtom =
      Atom(name: 'BluetoothStoreBase.flutterBluePlus', context: context);

  @override
  FlutterBluePlus get flutterBluePlus {
    _$flutterBluePlusAtom.reportRead();
    return super.flutterBluePlus;
  }

  @override
  set flutterBluePlus(FlutterBluePlus value) {
    _$flutterBluePlusAtom.reportWrite(value, super.flutterBluePlus, () {
      super.flutterBluePlus = value;
    });
  }

  @override
  String toString() {
    return '''
state: ${state},
flutterBluePlus: ${flutterBluePlus}
    ''';
  }
}
