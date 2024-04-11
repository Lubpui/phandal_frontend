import 'dart:convert';

ResponseErrorBody responseErrorBodyFromJson(String str) =>
    ResponseErrorBody.fromJson(json.decode(str));

String responseErrorBodyToJson(ResponseErrorBody data) =>
    json.encode(data.toJson());

class ResponseErrorBody {
  int? statusCode;
  String? message;

  ResponseErrorBody({
    this.statusCode,
    this.message,
  });

  factory ResponseErrorBody.fromJson(Map<String, dynamic> json) =>
      ResponseErrorBody(
        statusCode: json["statusCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
      };
}
