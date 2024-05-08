// ignore_for_file: non_constant_identifier_names, unused_element, avoid_print, curly_braces_in_flow_control_structures, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';
import 'package:phandal_frontend/model/color_model.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/user_model.dart';
import 'package:phandal_frontend/utils/utils.dart';

class Sheet extends StatefulWidget {
  final Device device;

  const Sheet({super.key, required this.device});

  @override
  State<Sheet> createState() => _SheetState();
}

void _closeBottomSheet(BuildContext context) {
  Navigator.pop(context);
}

class _SheetState extends State<Sheet> {
  //widget 5 Colors
  int _selectedColor = 0;

  BluetoothConnection? connection;

  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);

  bool isDisconnecting = false;

  //widget Dropdown
  String? selectedValue;
  List<String> dropdownItem = ["semi", "burst"];

  final List<ColorObject> colors = [
    ColorObject(primary: "#FF0000", secondary: "#FF7373", name: "red"),
    ColorObject(primary: "#FFA800", secondary: "#FFCC6A", name: "orange"),
    ColorObject(primary: "#FFF500", secondary: "#FFFCAB", name: "yellow"),
    ColorObject(primary: "#00FF1A", secondary: "#8EFF99", name: "green"),
    ColorObject(primary: "#0019FF", secondary: "#4F76FF", name: "blue"),
  ];

  @override
  void initState() {
    _selectedColor = colors.indexWhere(
      (item) => item.name == widget.device.configurations.lightColor,
    );

    selectedValue = widget.device.configurations.mode;

    requestBluetoothPermission();

    super.initState();
  }

  void requestBluetoothPermission() async {
    PermissionStatus bluetoothStatus = await Permission.bluetoothScan.request();
    PermissionStatus bluetoothConnectStatus =
        await Permission.bluetoothConnect.request();

    if (bluetoothStatus.isGranted && bluetoothConnectStatus.isGranted) {
      BluetoothConnection.toAddress(widget.device.address).then(
        (_connection) {
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
        },
      ).catchError(
        (error) {
          print('Cannot connect, exception occured');
          print(error);
        },
      );
    }
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

  Widget Radiopress(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedColor = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _selectedColor == index
                    ? Color(toIntColor("#6BC7E9"))
                    : Color(toIntColor(colors[index].secondary)),
                width: 5,
              ),
              color: _selectedColor == index
                  ? Color(toIntColor(colors[index].primary))
                  : Color(toIntColor(colors[index].primary)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [AppPallete.buttongradient2, AppPallete.buttongradient1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Light Color for ${widget.device.name}",
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 5; i++) Radiopress(i),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xff3E5888),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: DropdownButton<String>(
                          hint: const Text("Select Mode"),
                          value: selectedValue,
                          items: dropdownItem.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                          isExpanded: true,
                          dropdownColor: const Color(0xff3E5888),
                          borderRadius: BorderRadius.circular(20),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xff87A2D3),
                          ),
                          iconSize: 20,
                          underline: const SizedBox(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  if (colors[_selectedColor].name !=
                          widget.device.configurations.lightColor ||
                      selectedValue != widget.device.configurations.mode) {
                    if (selectedValue == null || connection == null) return;

                    Map<String, dynamic> body = {
                      "color": colors[_selectedColor].name,
                      "mode": selectedValue
                    };

                    String jsonBody = json.encode(body);

                    print(jsonBody);

                    connection?.output.add(utf8.encode(jsonBody));
                    connection?.output.allSent;

                    context.read<UserBloc>().add(
                          UserEventUpdateConfiguration(
                            widget.device.id,
                            colors[_selectedColor].name,
                            selectedValue!,
                          ),
                        );

                    GoRouter.of(context).pop();
                    context.read<UserBloc>().add(UserEventGetUser());
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: colors[_selectedColor].name !=
                                widget.device.configurations.lightColor ||
                            selectedValue != widget.device.configurations.mode
                        ? const Color(0xff6BC7E9)
                        : Colors.grey[600],
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: colors[_selectedColor].name !=
                                    widget.device.configurations.lightColor ||
                                selectedValue !=
                                    widget.device.configurations.mode
                            ? const Color(0xff1E345C)
                            : Colors.grey[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  connection?.output.add(utf8.encode('0'));
                  connection?.output.allSent;
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xffFF6767),
                  ),
                  child: const Center(
                    child: Text(
                      "Disconnect",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
