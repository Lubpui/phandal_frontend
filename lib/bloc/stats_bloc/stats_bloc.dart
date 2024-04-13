import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phandal_frontend/bloc/stats_bloc/stats_events.dart';
import 'package:phandal_frontend/bloc/stats_bloc/stats_states.dart';
import 'package:phandal_frontend/repository/bluetooth_repository/stats.dart';

class StatBloc extends Bloc<StatsEvents, StatsState> {
  final StatsRepository _statsRepository;

  StatBloc(this._statsRepository) : super(StatLoading()) {
    on<LoadingStatsEvents>(
      (event, emit) async {
        emit(StatLoading());
        print("Stats loading");
        try {
          final stats = await _statsRepository.getStats();
          emit(StatLoaded(stats));
          print("Stats loaded");
        } catch (e) {
          emit(StatrrorState(e.toString()));
        }
      },
    );
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
