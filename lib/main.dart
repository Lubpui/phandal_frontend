// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phandal_frontend/core/theme/app_theme.dart';
import 'package:phandal_frontend/repository/bluetooth_repository/bluetooth.dart';
import 'package:phandal_frontend/repository/bluetooth_repository/stats.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BluetoothRepository>(
          create: (context) => BluetoothRepository(),
        ),
        RepositoryProvider<StatsRepository>(
          create: (context) => StatsRepository(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Phandal App',
        theme: AppTheme.darkThemeMode,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
