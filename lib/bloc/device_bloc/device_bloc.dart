import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phandal_frontend/bloc/device_bloc/device_events.dart';
import 'package:phandal_frontend/bloc/device_bloc/device_states.dart';
import 'package:phandal_frontend/repository/bluetooth_repository/bluetooth.dart';

class BTBloc extends Bloc<BTEvents, BTState> {
  final BluetoothRepository _bluetoothRepository;

  BTBloc(this._bluetoothRepository) : super(BTLoading()) {
    on<LoadingBTEvent>((event, emit) async {
      final devices = await _bluetoothRepository.getDevice();
      emit(BTloaded(devices));
    });
  }
}












/*import 'package:flutter_application_bloc/bloc/app_events.dart';
import 'package:flutter_application_bloc/bloc/app_states.dart';
import 'package:flutter_application_bloc/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(Userloading()) {
    on<LoadUserEvent>(
      (event, emit) async {
        emit(Userloading());
        try {
          final users = await _userRepository.getUsers();
          emit(Userloaded(users));
        } catch (e) {
          emit(UserErrorState(e.toString()));
        }
      },
    );
  }
}*/
