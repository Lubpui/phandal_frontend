import 'package:equatable/equatable.dart';
import 'package:phandal_frontend/model/bluetooth_model.dart';

sealed class BTState extends Equatable {}

class BTLoading extends BTState {
  @override
  List<Object?> get props => [];
}

class BTloaded extends BTState {
  BTloaded(this.devices);
  final List<BluetoothModel> devices;
  @override
  List<Object?> get props => [devices];
}

class BTErrorState extends BTState {
  BTErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
