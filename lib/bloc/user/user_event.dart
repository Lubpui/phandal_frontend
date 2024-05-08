part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserEventRegister extends UserEvent {}

class UserEventGetUser extends UserEvent {}

class UserEventUpdateUser extends UserEvent {
  final String name;
  final String address;

  UserEventUpdateUser(this.name, this.address);
}

class UserEventUpdateConfiguration extends UserEvent {
  final String id;
  final String lightColor;
  final String mode;

  UserEventUpdateConfiguration(
    this.id,
    this.lightColor,
    this.mode,
  );
}

class UserEventAddDevice extends UserEvent {
  final Device device;

  UserEventAddDevice(this.device);
}
