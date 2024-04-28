import 'dart:convert';

import 'package:phandal_frontend/model/score_model.dart';

List<HistoryModel> historyModelFromJson(String str) => List<HistoryModel>.from(
    json.decode(str).map((x) => HistoryModel.fromJson(x)));

String historyModelToJson(List<HistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryModel {
  Team redTeam;
  Team blueTeam;

  HistoryModel({
    required this.redTeam,
    required this.blueTeam,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        redTeam: Team.fromJson(json["redTeam"]),
        blueTeam: Team.fromJson(json["blueTeam"]),
      );

  Map<String, dynamic> toJson() => {
        "redTeam": redTeam.toJson(),
        "blueTeam": blueTeam.toJson(),
      };
}

class Team {
  String userId;
  Score score;
  String team;
  String competitionResult;

  Team({
    required this.userId,
    required this.score,
    required this.team,
    required this.competitionResult,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        userId: json["userId"],
        score: Score.fromJson(json["score"]),
        team: json["team"],
        competitionResult: json["competitionResult"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "score": score.toJson(),
        "team": team,
        "competitionResult": competitionResult,
      };
}
