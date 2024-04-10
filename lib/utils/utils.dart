int toIntColor(String color) {
  var hexColor = color.replaceAll("#", "");
  return int.parse("0xFF$hexColor");
}
