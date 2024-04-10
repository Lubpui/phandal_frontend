// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_theme.dart';
import 'package:phandal_frontend/pages/apitest_page.dart';
import 'package:phandal_frontend/pages/bluetooth_connect_page.dart';
import 'package:phandal_frontend/pages/home_page.dart';
import 'package:phandal_frontend/model/userDB.dart';
import 'package:phandal_frontend/pages/dashboard_page.dart';
import 'package:phandal_frontend/pages/login_page.dart';
import 'package:phandal_frontend/pages/setting_page.dart';
import 'package:phandal_frontend/routes/routes.dart';
import 'package:provider/provider.dart';

// import 'package:phandal_frontend/home_page.dart';
// import 'package:phandal_frontend/home_page.dart';
import 'package:phandal_frontend/pages/register_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phandal App',
        routes: AppRoute.all,
        theme: AppTheme.darkThemeMode,
        home: APIPage() /* HomePage(
        title: 'Phandal',
      ), */
        );
  }
}
