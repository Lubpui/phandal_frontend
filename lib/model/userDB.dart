class UserModel {
  final String name;
  final String imageUrl;

  UserModel({required this.name, required this.imageUrl});
}

class UserModelDB {
  static final List<UserModel> modelDB = [
    UserModel(
      name: "PatcharaPN",
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_CCRvW0Z7s0SH-1TFYoKxDg5P6A34J6XsyqUJEk4XYQ&s',
    )
  ];
}
