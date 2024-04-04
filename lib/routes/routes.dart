import 'package:flutter/material.dart';
import 'package:phandal_frontend/pages/bluetooth_connect_page.dart';
import 'package:phandal_frontend/pages/dashboard_page.dart';
import 'package:phandal_frontend/pages/home_page.dart';
import 'package:phandal_frontend/pages/login_page.dart';
import 'package:phandal_frontend/pages/register_page.dart';
import 'package:phandal_frontend/pages/setting_page.dart';

class AppRoute {
  static const home = 'home-page';
  static const loginpage = 'login-page';
  static const registerpage = 'register-page';
  static const bluetoothpage = 'bluetooth-page';
  static const dashboardpage = 'dashboard-page';
  static const settingpagepage = 'settingpage-page';

  static get all => <String, WidgetBuilder>{
        home: (BuildContext context) => const HomePage(),
        loginpage: (BuildContext context) => const LoginPage(),
        registerpage: (BuildContext context) => const RegisterPage(),
        bluetoothpage: (BuildContext context) => const BluetoothConnectPage(),
        dashboardpage: (BuildContext context) => DashBoard(),
        settingpagepage: (BuildContext context) => const SettingPage(),
      };
}
