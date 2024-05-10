part of 'history_bloc.dart';

class HistoryState extends Equatable {
  final List<HistoryModel>? history;

  const HistoryState({this.history});

  HistoryState copyWith({List<HistoryModel>? history}) {
    return HistoryState(
      history: history ?? this.history,
    );
  }

  @override
  List<Object> get props => [];
}
