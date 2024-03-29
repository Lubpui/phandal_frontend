import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/ThemeApp.dart';
import 'package:phandal_frontend/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: HomePage(),
    );
  }
}
