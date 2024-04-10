import 'package:flutter/material.dart';
import 'package:phandal_frontend/pages/bluetooth_connect_page.dart';
import 'package:phandal_frontend/pages/dashboard_page.dart';
import 'package:phandal_frontend/pages/home_page.dart';
import 'package:phandal_frontend/pages/login_page.dart';
import 'package:phandal_frontend/pages/register_page.dart';
import 'package:phandal_frontend/pages/setting_page.dart';

class AppRoute {
  static const homePage = 'home-page';
  static const loginPage = 'login-page';
  static const registerPage = 'register-page';
  static const bluetoothConnectPage = 'bluetooth-connect-page';
  static const dashboardPage = 'dashboard-page';
  static const settingPage = 'settingpage-page';

  static get all => <String, WidgetBuilder>{
        homePage: (BuildContext context) => const HomePage(),
        loginPage: (BuildContext context) => const LoginPage(),
        registerPage: (BuildContext context) => const RegisterPage(),
        bluetoothConnectPage: (BuildContext context) =>
            const BluetoothConnectPage(),
        dashboardPage: (BuildContext context) => DashBoard(),
        settingPage: (BuildContext context) => const SettingPage(),
      };
}
