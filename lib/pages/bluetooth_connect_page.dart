// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers, unused_element, avoid_print, unnecessary_this, no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/utils/utils.dart';
import 'package:phandal_frontend/widget/device_widget.dart';
import 'package:phandal_frontend/widget/searchbar_widget.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class BluetoothConnectPage extends StatefulWidget {
  final bool start;

  const BluetoothConnectPage({super.key, this.start = true});

  @override
  State<BluetoothConnectPage> createState() => _BluetoothConnectPageState();
}

class _BluetoothConnectPageState extends State<BluetoothConnectPage> {
  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  static List<BluetoothDiscoveryResult> otherResults =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  static List<BluetoothDiscoveryResult> myResults =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  bool isDiscovering = false;

  BluetoothConnection? connection;

  // BluetoothDevice? devices;

  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);

  bool isDisconnecting = false;

  @override
  void initState() {
    super.initState();

    isDiscovering = widget.start;
    if (isDiscovering) {
      requestBluetoothPermission();
    }
  }

  void requestBluetoothPermission() async {
    PermissionStatus bluetoothStatus = await Permission.bluetoothScan.request();
    PermissionStatus bluetoothConnectStatus =
        await Permission.bluetoothConnect.request();

    if (bluetoothStatus.isGranted && bluetoothConnectStatus.isGranted) {
      _startDiscovery();
    }
  }

  void _restartDiscovery() {
    if (connection != null) {
      connection!.output.add(utf8.encode('0'));
      connection!.output.allSent;
    }

    setState(() {
      otherResults.clear();
      myResults.clear();
      isDiscovering = true;
    });

    _startDiscovery();
  }

  void _startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      if (r.device.isConnected || r.device.isBonded) {
        setState(() {
          final existingIndex = myResults.indexWhere(
            (element) => element.device.address == r.device.address,
          );

          if (existingIndex >= 0) {
            myResults[existingIndex] = r;
          } else {
            myResults.add(r);
          }
        });
      } else {
        setState(() {
          final existingIndex = otherResults.indexWhere(
            (element) => element.device.address == r.device.address,
          );

          if (existingIndex >= 0) {
            otherResults[existingIndex] = r;
          } else {
            otherResults.add(r);
          }
          _sortResults();
        });
      }
    });

    _streamSubscription!.onDone(() {
      setState(() {
        isDiscovering = false;
      });
    });
  }

  void _sortResults() {
    otherResults.sort((a, b) => b.rssi.compareTo(a.rssi));
    setState(() {});
  }

  void _connection(BluetoothDevice device) async {
    await BluetoothConnection.toAddress(device.address).then((_connection) {
      print('Connected to the device');
      connection = _connection;
      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });

      connection!.input!.listen(_onDataReceived).onDone(() {
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
        if (this.mounted) {
          setState(() {});
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occured');
      print(error);
    });
  }

  void _onDataReceived(Uint8List data) {
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UserData()],
        toolbarHeight: 90,
        surfaceTintColor: AppPallete.transparentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              color: AppPallete.backgroundColor,
              child: SearchBarWidget(
                onChanged: (value) {},
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "My devices",
                          style: TextStyle(
                            color: Color(toIntColor("#496BA5")),
                          ),
                        ),
                      ),
                      myResults.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: myResults.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: DeviceWidget(
                                    device: myResults[index].device,
                                    rssi: myResults[index].rssi,
                                    onTap: () {},
                                    onLongPress: () {},
                                  ),
                                );
                              },
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Device not connected',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(toIntColor("#496BA5")),
                                  ),
                                )
                              ],
                            ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Other devices",
                                  style: TextStyle(
                                    color: Color(toIntColor("#496BA5")),
                                  ),
                                ),
                                isDiscovering
                                    ? FittedBox(
                                        child: Container(
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.white),
                                          ),
                                        ),
                                      )
                                    : IconButton(
                                        icon: Icon(Icons.replay,
                                            color: Colors.white),
                                        onPressed: _restartDiscovery,
                                      )
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: otherResults.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: DeviceWidget(
                                  device: otherResults[index].device,
                                  rssi: otherResults[index].rssi,
                                  onTap: () {
                                    setState(() {
                                      BluetoothDevice device =
                                          otherResults[index].device;

                                      _connection(device);

                                      if (device.name != null) {
                                        context.read<UserBloc>().add(
                                              UserEventUpdateUser(
                                                device.name!,
                                                device.address,
                                              ),
                                            );
                                      }
                                      myResults.add(otherResults[index]);
                                      otherResults.remove(otherResults[index]);
                                    });
                                  },
                                  onLongPress: () {},
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
