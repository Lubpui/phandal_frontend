// ignore_for_file: avoid_print, unnecessary_new

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/model/history_model.dart';
import 'package:phandal_frontend/model/response_body_model.dart';
import 'package:phandal_frontend/routes/app_router.dart';
import 'package:http/http.dart' as http;
import 'package:phandal_frontend/widget/flash_message_screen.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  static final context = AppRouter.rootNavigatorKey.currentContext;
  HistoryBloc() : super(const HistoryState()) {
    on<HistoryEvent>((event, emit) async {
      try {
        var userId = await AppRouter.fss.read(key: 'userId');
        var accessToken = await AppRouter.fss.read(key: 'accessToken');

        if (context == null) return;
        showDialog(
          context: context!,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );

        var uri = Uri.parse(
            'https://phandal-backend.onrender.com/api/history/$userId');
        var res = await http.get(uri, headers: {
          'Authorization': 'Bearer $accessToken',
        });

        if (res.statusCode == 200) {
          print('get user data successfully...');

          final history = historyModelFromJson(res.body);

          emit(state.copyWith(history: history));
        } else {
          print('filed... ${res.statusCode} ${res.reasonPhrase}');

          ResponseBody responseBody = responseBodyFromJson(res.body);

          if (res.statusCode == 401) {
            await AppRouter.fss.deleteAll();
            GoRouter.of(context!).go('/login');
          }

          FlashMessageScreen.show(
            context!,
            responseBody.message!,
            responseBody.statusCode!,
          );
        }
        GoRouter.of(context!).pop();
      } catch (e) {
        throw new Exception('Error: ${e.toString()}');
      }
    });
  }
}
