// ignore_for_file: unnecessary_null_comparison

class UserResponse {
  final String error;

  UserResponse({this.error = ''});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(error: json['error']) != null ? json['error'] : '';
  }
}

class UserRequest {
  String? username;
  String? password;
  String? email;
  String? birth;
  String? conpassword;

  UserRequest(
      {this.username, this.password, this.email, this.birth, this.conpassword});

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        username: json['username'],
        password: json['password'],
        email: json['email'],
        birth: json['birth'],
        conpassword: json['conpassword'],
      );
}
