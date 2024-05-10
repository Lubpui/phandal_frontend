import 'dart:convert';

PlayerInfo playerInfoFromJson(String str) =>
    PlayerInfo.fromJson(json.decode(str));

String playerInfoToJson(PlayerInfo data) => json.encode(data.toJson());

class PlayerInfo {
  int? hp;
  int? short;

  PlayerInfo({
    this.hp,
    this.short,
  });

  factory PlayerInfo.fromJson(Map<String, dynamic> json) => PlayerInfo(
        hp: json["hp"],
        short: json["short"],
      );

  Map<String, dynamic> toJson() => {
        "hp": hp,
        "short": short,
      };
}
