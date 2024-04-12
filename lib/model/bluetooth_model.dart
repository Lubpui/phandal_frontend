// To parse this JSON data, do
//
//     final bluetoothModel = bluetoothModelFromJson(jsonString);

import 'dart:convert';

List<BluetoothModel> bluetoothModelFromJson(String str) =>
    List<BluetoothModel>.from(
        json.decode(str).map((x) => BluetoothModel.fromJson(x)));

String bluetoothModelToJson(List<BluetoothModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BluetoothModel {
  String bluetoothName;
  String bluetoothMacId;
  int battery;

  BluetoothModel({
    required this.bluetoothName,
    required this.bluetoothMacId,
    required this.battery,
  });

  factory BluetoothModel.fromJson(Map<String, dynamic> json) => BluetoothModel(
        bluetoothName: json["BluetoothName"],
        bluetoothMacId: json["BluetoothMacID"],
        battery: json["Battery"],
      );

  Map<String, dynamic> toJson() => {
        "BluetoothName": bluetoothName,
        "BluetoothMacID": bluetoothMacId,
        "Battery": battery,
      };
}
