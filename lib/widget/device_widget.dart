// ignore_for_file: unnecessary_string_interpolations, unused_element, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/utils/utils.dart';

class DeviceWidget extends ListTile {
  DeviceWidget({
    super.key,
    required BluetoothDevice device,
    int? rssi,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    bool enabled = true,
  }) : super(
            onTap: onTap,
            onLongPress: onLongPress,
            enabled: enabled,
            title: Text(
              device.name != null ? '${device.name}' : 'Unknown Device',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${device.address}',
              style: TextStyle(
                color: Color(toIntColor("#678BCA")),
                fontSize: 14,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            contentPadding: EdgeInsets.all(20),
            tileColor: AppPallete.buttongradient2,
            trailing: rssi != null
                ? Column(
                    children: [
                      _computeTextStyle(rssi),
                      device.isBonded
                          ? Text('isB', style: TextStyle(fontSize: 8))
                          : Text('', style: TextStyle(fontSize: 0)),
                      device.isConnected
                          ? Text('isC', style: TextStyle(fontSize: 8))
                          : Text('', style: TextStyle(fontSize: 0)),
                    ],
                  )
                : Container());

  static Icon _computeTextStyle(int rssi) {
    if (rssi >= -35)
      return Icon(
        Icons.bluetooth,
        color: Colors.greenAccent[700],
        size: 28,
      );
    else if (rssi >= -45)
      return Icon(
        Icons.bluetooth,
        color: Colors.lightGreen,
        size: 28,
      );
    else if (rssi >= -55)
      return Icon(
        Icons.bluetooth,
        color: Colors.lime[600],
        size: 28,
      );
    else if (rssi >= -65)
      return Icon(
        Icons.bluetooth,
        color: Colors.amber,
        size: 28,
      );
    else if (rssi >= -75)
      return Icon(
        Icons.bluetooth,
        color: Colors.deepOrangeAccent,
        size: 28,
      );
    else if (rssi >= -85)
      return Icon(
        Icons.bluetooth,
        color: Colors.redAccent,
        size: 28,
      );
    else
      return Icon(
        Icons.bluetooth,
        color: Colors.red,
        size: 28,
      );
  }
}
