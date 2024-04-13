import 'package:equatable/equatable.dart';
import 'package:phandal_frontend/model/userstats_model.dart';

sealed class StatsState extends Equatable {}

class StatLoading extends StatsState {
  @override
  List<Object?> get props => [];
}

class StatLoaded extends StatsState {
  StatLoaded(this.stat);
  final List<UserStats> stat;
  @override
  List<Object?> get props => [stat];
}

class StatrrorState extends StatsState {
  StatrrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
