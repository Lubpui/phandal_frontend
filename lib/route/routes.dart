import 'package:flutter/material.dart';
import 'package:phandal_frontend/pages/bluetooth_connect_page.dart';
import 'package:phandal_frontend/pages/dashboard_page.dart';
import 'package:phandal_frontend/pages/login_page.dart';
import 'package:phandal_frontend/pages/setting_page.dart';

class AppRoute {
  static const loginpage = 'login-page';
  static const bluetoothpage = 'bluetooth-page';
  static const dashboardpage = 'dashboard-page';
  static const settingpagepage = 'settingpage-page';

  static get all => <String, WidgetBuilder>{
        loginpage: (BuildContext context) => const LoginPage(),
        bluetoothpage: (BuildContext context) => const BluetoothConnectPage(),
        dashboardpage: (BuildContext context) => DashBoard(),
        settingpagepage: (BuildContext context) => const SettingPage(),
      };
}
