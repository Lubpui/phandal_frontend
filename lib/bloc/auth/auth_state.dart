part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isAuth;
  final String userId;

  const AuthState({this.isAuth = false, this.userId = ''});

  AuthState copyWith({bool? isAuth, String? userId}) {
    return AuthState(
      isAuth: isAuth ?? this.isAuth,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object> get props => [isAuth, userId];
}

class AuthLoadingState extends AuthState {}
