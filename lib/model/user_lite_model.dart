import 'dart:convert';

UserLite userLiteFromJson(String str) => UserLite.fromJson(json.decode(str));

String userLiteToJson(UserLite data) => json.encode(data.toJson());

class UserLite {
  String id;
  String username;
  String image;

  UserLite({
    required this.id,
    required this.username,
    required this.image,
  });

  factory UserLite.fromJson(Map<String, dynamic> json) => UserLite(
        id: json["_id"],
        username: json["username"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "image": image,
      };
}
