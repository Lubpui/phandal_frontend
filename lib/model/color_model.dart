class ColorObject {
  String primary;
  String secondary;
  String name;

  ColorObject({
    required this.primary,
    required this.secondary,
    required this.name,
  });

  factory ColorObject.fromJson(Map<String, dynamic> json) => ColorObject(
        primary: json["primary"],
        secondary: json["secondary"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": secondary,
        "name": name,
      };
}
