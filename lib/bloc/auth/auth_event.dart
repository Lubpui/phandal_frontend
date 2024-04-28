part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthEventLogin extends AuthEvent {
  final LoginModel payload;
  AuthEventLogin(this.payload);
}
