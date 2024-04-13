import 'package:equatable/equatable.dart';

sealed class StatsEvents extends Equatable {
  const StatsEvents();
}

class LoadingStatsEvents extends StatsEvents {
  @override
  List<Object?> get props => throw [];
}
