import 'package:equatable/equatable.dart';

sealed class BTEvents extends Equatable {
  const BTEvents();
}

class LoadingBTEvent extends BTEvents {
  @override
  List<Object?> get props => throw [];
}
