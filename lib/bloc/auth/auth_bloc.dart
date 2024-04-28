// ignore_for_file: avoid_print, unnecessary_new

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:phandal_frontend/model/response_body_model.dart';
import 'package:phandal_frontend/routes/app_router.dart';
import 'package:phandal_frontend/widget/flash_message_screen.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static final context = AppRouter.rootNavigatorKey.currentContext;

  AuthBloc() : super(const AuthState()) {
    on<AuthEventLogin>(login);
  }

  FutureOr<void> login(AuthEventLogin event, Emitter<AuthState> emit) async {
    // print(event.payload.email);

    try {
      if (context == null) return;

      Map<String, String> body = {
        'email': event.payload.email,
        'password': event.payload.password,
      };

      var uri =
          Uri.parse('https://phandal-backend.onrender.com/api/auth/login');
      var res = await http.post(uri, body: body);

      if (res.statusCode == 201) {
        print('Login successfully...');

        final body = responseBodyFromJson(res.body);

        emit(state.copyWith(isAuth: true, userId: body.userId));

        FlashMessageScreen.show(
          context!,
          'Login successfully...',
          res.statusCode,
        );

        AppRouter.fss.write(key: 'accessToken', value: body.accessToken);

        GoRouter.of(context!).go('/home');
      } else {
        print('Login filed...');
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
  }
}
