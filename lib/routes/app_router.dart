import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/main_wrapper.dart';
import 'package:phandal_frontend/pages/bluetooth_connect_page.dart';
import 'package:phandal_frontend/pages/dashboard_page.dart';
import 'package:phandal_frontend/pages/home_page.dart';
import 'package:phandal_frontend/pages/setting_page.dart';

class AppRouter {
  AppRouter._();

  static String initRoute = '/home';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome = GlobalKey<NavigatorState>(
    debugLabel: 'shellHome',
  );
  static final _rootNavigatorMatch = GlobalKey<NavigatorState>(
    debugLabel: 'shellMatch',
  );
  static final _rootNavigatorScoreBoard = GlobalKey<NavigatorState>(
    debugLabel: 'shellScoreBoard',
  );
  static final _rootNavigatorSetting = GlobalKey<NavigatorState>(
    debugLabel: 'shellSetting',
  );

  static final GoRouter router = GoRouter(
    initialLocation: initRoute,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                path: '/home',
                name: 'Home',
                builder: (context, state) => HomePage(
                  key: state.pageKey,
                ),
                routes: [
                  GoRoute(
                    path: 'bluetoothConnect',
                    name: 'BluetoothConnect',
                    builder: (context, state) => BluetoothConnectPage(
                      key: state.pageKey,
                    ),
                  )
                ],
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorMatch,
            routes: [
              GoRoute(
                path: '/match',
                name: 'Match',
                builder: (context, state) => HomePage(
                  key: state.pageKey,
                ),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorScoreBoard,
            routes: [
              GoRoute(
                path: '/scoreBoard',
                name: 'ScoreBoard',
                builder: (context, state) => DashBoard(
                  key: state.pageKey,
                ),
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorSetting,
            routes: [
              GoRoute(
                path: '/setting',
                name: 'Setting',
                builder: (context, state) => SettingPage(
                  key: state.pageKey,
                ),
              )
            ],
          ),
        ],
      )
    ],
  );
}
