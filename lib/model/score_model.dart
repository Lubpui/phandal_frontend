import 'dart:convert';

List<Score> scoreFromJson(String str) =>
    List<Score>.from(json.decode(str).map((x) => Score.fromJson(x)));

String scoreToJson(List<Score> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Score {
  int killed;
  int death;
  double acc;
  int hit;
  int short;

  Score({
    required this.killed,
    required this.death,
    required this.acc,
    required this.hit,
    required this.short,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        killed: json["killed"],
        death: json["death"],
        acc: json["acc"]?.toDouble(),
        hit: json["hit"],
        short: json["short"],
      );

  Map<String, dynamic> toJson() => {
        "killed": killed,
        "death": death,
        "acc": acc,
        "hit": hit,
        "short": short,
      };
}
