import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String email;
  final String password;

  LoginModel({
    required this.password,
    required this.email,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
      };
}
