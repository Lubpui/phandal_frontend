import 'package:flutter/foundation.dart';
import 'package:phandal_frontend/model/usermodel.dart';

class UserProvider extends ChangeNotifier {
  final List<Usermodel> _users = [
    Usermodel(
      name: "PatcharaPN",
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_CCRvW0Z7s0SH-1TFYoKxDg5P6A34J6XsyqUJEk4XYQ&s',
    ),
  ];

  List<Usermodel> get users => _users;

  void addUser(Usermodel user) {
    _users.add(user);
    notifyListeners(); // Notify listeners of changes
  }
}
