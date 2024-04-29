part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserEventAddUser extends UserEvent {}

class UserEventRegister extends UserEvent {}

class UserEventGetUser extends UserEvent {}
