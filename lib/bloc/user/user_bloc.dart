// ignore_for_file: unnecessary_new, avoid_print

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/model/response_body_model.dart';
import 'package:phandal_frontend/model/user_model.dart';
import 'package:phandal_frontend/routes/app_router.dart';
import 'package:http/http.dart' as http;
import 'package:phandal_frontend/widget/flash_message_screen.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  static final context = AppRouter.rootNavigatorKey.currentContext;
  UserBloc() : super(const UserState()) {
    on<UserEventGetUser>((event, emit) async {
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
            'https://phandal-backend.onrender.com/api/user/profile/$userId');
        var res = await http.get(uri, headers: {
          'Authorization': 'Bearer $accessToken',
        });

        if (res.statusCode == 200) {
          print('get user data successfully...');

          final user = userModelFromJson(res.body);

          emit(state.copyWith(user: user));
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

    on<UserEventUpdateUser>((event, emit) async {
      try {
        if (context == null || state.user == null) return;

        Map<String, String> body = {
          'name': event.name,
          'address': event.address,
          'userId': state.user!.id
        };

        var uri = Uri.parse('https://phandal-backend.onrender.com/api/device');
        var res = await http.post(uri, body: body);

        if (res.statusCode == 201) {
          print('crete device successfully...');
        } else {
          print('filed... ${res.statusCode} ${res.reasonPhrase}');

          ResponseBody responseBody = responseBodyFromJson(res.body);

          FlashMessageScreen.show(
            context!,
            responseBody.message!,
            responseBody.statusCode!,
          );
        }
      } catch (e) {
        throw new Exception('Error: ${e.toString()}');
      }
    });

    on<UserEventUpdateConfiguration>((event, emit) async {
      try {
        if (context == null || state.user == null) return;

        Map<String, dynamic> body = {
          "lightColor": event.lightColor,
          "mode": event.mode
        };

        var uri = Uri.parse(
            'https://phandal-backend.onrender.com/api/device/configuration/update/${event.id}');
        var res = await http.patch(uri, body: body);

        if (res.statusCode == 200) {
          print('update device successfully...');
        } else {
          print('filed... ${res.statusCode} ${res.reasonPhrase}');

          ResponseBody responseBody = responseBodyFromJson(res.body);

          FlashMessageScreen.show(
            context!,
            responseBody.message!,
            responseBody.statusCode!,
          );
        }
      } catch (e) {
        throw new Exception('Error: ${e.toString()}');
      }
    });

    on<UserEventAddDevice>(
      (event, emit) {
        emit(state.copyWith(device: event.device));
      },
    );

    on<UserEventDeleteDevice>((event, emit) async {
      try {
        if (context == null || state.user == null) return;

        Map<String, dynamic> body = {
          "userId": event.userId,
          "deviceId": event.deviceId
        };

        var uri =
            Uri.parse('https://phandal-backend.onrender.com/api/device/delete');
        var res = await http.delete(uri, body: body);

        if (res.statusCode == 200) {
          print('delete device successfully...');
        } else {
          print('filed... ${res.statusCode} ${res.reasonPhrase}');

          ResponseBody responseBody = responseBodyFromJson(res.body);

          FlashMessageScreen.show(
            context!,
            responseBody.message!,
            responseBody.statusCode!,
          );
        }

        // GoRouter.of(context!).pop();
      } catch (e) {
        throw new Exception('Error: ${e.toString()}');
      }
    });
  }
}
