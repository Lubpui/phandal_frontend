part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserModel? user;

  const UserState({this.user});

  UserState copyWith({UserModel? user}) {
    return UserState(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}
