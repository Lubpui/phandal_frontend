import 'dart:convert';

ResponseBody responseBodyFromJson(String str) =>
    ResponseBody.fromJson(json.decode(str));

String responseBodyToJson(ResponseBody data) => json.encode(data.toJson());

class ResponseBody {
  int? statusCode;
  String? message;
  String? accessToken;
  String? userId;

  ResponseBody({this.statusCode, this.message, this.accessToken, this.userId});

  factory ResponseBody.fromJson(Map<String, dynamic> json) => ResponseBody(
        statusCode: json["statusCode"],
        message: json["message"],
        accessToken: json["accessToken"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "accessToken": accessToken,
        "userId": userId,
      };
}
