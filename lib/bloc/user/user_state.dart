part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserModel? user;
  final Device? device;

  const UserState({this.user, this.device});

  UserState copyWith({UserModel? user, Device? device}) {
    return UserState(
      user: user ?? this.user,
      device: device ?? this.device,
    );
  }

  @override
  List<Object?> get props => [user];
}
