// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phandal_frontend/bloc/auth/auth_bloc.dart';
import 'package:phandal_frontend/bloc/history/history_bloc.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';
import 'package:phandal_frontend/core/theme/app_theme.dart';
import 'package:phandal_frontend/routes/app_router.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider<UserBloc>(create: (context) => UserBloc());
    final authBloc = BlocProvider<AuthBloc>(create: (context) => AuthBloc());
    final historyBloc =
        BlocProvider<HistoryBloc>(create: (context) => HistoryBloc());

    return MultiBlocProvider(
      providers: [userBloc, authBloc, historyBloc],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Phandal App',
        theme: AppTheme.darkThemeMode,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
