// To parse this JSON data, do
//
//     final userStats = userStatsFromJson(jsonString);

import 'dart:convert';

List<UserStats> userStatsFromJson(String str) =>
    List<UserStats>.from(json.decode(str).map((x) => UserStats.fromJson(x)));

String userStatsToJson(List<UserStats> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserStats {
  int kill;
  int deaths;
  int kd;
  int acc;
  int wins;
  int loses;

  UserStats({
    required this.kill,
    required this.deaths,
    required this.kd,
    required this.acc,
    required this.wins,
    required this.loses,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) => UserStats(
        kill: json["Kill"],
        deaths: json["Deaths"],
        kd: json["KD"],
        acc: json["ACC"],
        wins: json["Wins"],
        loses: json["Loses"],
      );

  Map<String, dynamic> toJson() => {
        "Kill": kill,
        "Deaths": deaths,
        "KD": kd,
        "ACC": acc,
        "Wins": wins,
        "Loses": loses,
      };
}
