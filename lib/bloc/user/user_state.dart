part of 'user_bloc.dart';

class UserState extends Equatable {
  final String username;
  final String email;
  final String birthdate;
  final String image;

  const UserState({
    this.username = '',
    this.email = '',
    this.birthdate = '',
    this.image = 'https://phandal-backend.onrender.com/profile.png',
  });

  UserState copyWith(
      {String? username, String? email, String? birthdate, String? image}) {
    return UserState(
      username: username ?? this.username,
      email: email ?? this.email,
      birthdate: birthdate ?? this.birthdate,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [username, email, birthdate, image];
}
