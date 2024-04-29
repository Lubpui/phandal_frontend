import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String username;
  String email;
  String birthdate;
  String image;
  List<Device> devices;
  SummaryScore summaryScore;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.birthdate,
    required this.image,
    required this.devices,
    required this.summaryScore,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        birthdate: json["birthdate"],
        image: json["image"],
        devices:
            List<Device>.from(json["devices"].map((x) => Device.fromJson(x))),
        summaryScore: SummaryScore.fromJson(json["summaryScore"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "birthdate": birthdate,
        "image": image,
        "devices": List<dynamic>.from(devices.map((x) => x.toJson())),
        "summaryScore": summaryScore.toJson(),
      };
}

class Device {
  String id;
  String name;
  String address;
  Configurations configurations;

  Device({
    required this.id,
    required this.name,
    required this.address,
    required this.configurations,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        configurations: Configurations.fromJson(json["configurations"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "address": address,
        "configurations": configurations.toJson(),
      };
}

class Configurations {
  String id;
  String lightColor;
  int recoil;
  String mode;

  Configurations({
    required this.id,
    required this.lightColor,
    required this.recoil,
    required this.mode,
  });

  factory Configurations.fromJson(Map<String, dynamic> json) => Configurations(
        id: json["_id"],
        lightColor: json["lightColor"],
        recoil: json["recoil"],
        mode: json["mode"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "lightColor": lightColor,
        "recoil": recoil,
        "mode": mode,
      };
}

class SummaryScore {
  String id;
  int killed;
  int death;
  int short;
  int winCount;
  int loseCount;

  SummaryScore({
    required this.id,
    required this.killed,
    required this.death,
    required this.short,
    required this.winCount,
    required this.loseCount,
  });

  factory SummaryScore.fromJson(Map<String, dynamic> json) => SummaryScore(
        id: json["_id"],
        killed: json["killed"],
        death: json["death"],
        short: json["short"],
        winCount: json["winCount"],
        loseCount: json["loseCount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "killed": killed,
        "death": death,
        "short": short,
        "winCount": winCount,
        "loseCount": loseCount,
      };
}
