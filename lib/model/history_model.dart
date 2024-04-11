import 'dart:convert';

import 'package:phandal_frontend/model/score_model.dart';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  List<Match> match;
  Score summaryScore;

  HistoryModel({
    required this.match,
    required this.summaryScore,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        match: List<Match>.from(json["match"].map((x) => Match.fromJson(x))),
        summaryScore: Score.fromJson(json["summaryScore"]),
      );

  Map<String, dynamic> toJson() => {
        "match": List<dynamic>.from(match.map((x) => x.toJson())),
        "summaryScore": summaryScore.toJson(),
      };
}

class Match {
  Team redTeam;
  Team blueTeam;

  Match({
    required this.redTeam,
    required this.blueTeam,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
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
  String competitionResults;

  Team({
    required this.userId,
    required this.score,
    required this.competitionResults,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        userId: json["userId"],
        score: Score.fromJson(json["score"]),
        competitionResults: json["competitionResults"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "score": score.toJson(),
        "competitionResults": competitionResults,
      };
}
