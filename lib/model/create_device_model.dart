import 'dart:convert';

CreateDevice createDeviceModelFromJson(String str) =>
    CreateDevice.fromJson(json.decode(str));

class CreateDevice {
  String name;
  String address;

  CreateDevice({
    required this.name,
    required this.address,
  });

  factory CreateDevice.fromJson(Map<String, dynamic> json) => CreateDevice(
        name: json["name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
      };
}
