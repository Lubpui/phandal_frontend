import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/main_wrapper.dart';
import 'package:phandal_frontend/pages/bluetooth_connect_page.dart';
import 'package:phandal_frontend/pages/codeInput_page.dart';
import 'package:phandal_frontend/pages/compettitive_page.dart';
import 'package:phandal_frontend/pages/dashboard_page.dart';
import 'package:phandal_frontend/pages/home_page.dart';
import 'package:phandal_frontend/pages/login_page.dart';
import 'package:phandal_frontend/pages/matchmaking_page.dart';
import 'package:phandal_frontend/pages/profile_page.dart';
import 'package:phandal_frontend/pages/register_page.dart';
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

  static final FlutterSecureStorage fss = FlutterSecureStorage();

  static final GoRouter router = GoRouter(
    initialLocation: initRoute,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
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
                  ),
                  GoRoute(
                    path: 'profilepage',
                    name: 'ProfilePage',
                    builder: (context, state) {
                      final initials = state.pathParameters['initials'];
                      return ProfilePage(
                        key: state.pageKey,
                        initials: initials ??
                            '', // Provide a default value if no param exists
                      );
                    },
                  ),
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
                  builder: (context, state) => MatchPage(
                        key: state.pageKey,
                      ),
                  routes: [
                    GoRoute(
                      path: 'competitive',
                      name: 'ComppititivePage',
                      builder: (context, state) => const CompPage(),
                    ),
                    GoRoute(
                      path: 'Join',
                      name: 'JoinPage',
                      builder: (context, state) => const JoinPage(),
                    ),
                  ])
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
      ),
      GoRoute(
        path: '/login',
        name: 'Login',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => LoginPage(key: state.pageKey),
      ),
      GoRoute(
        path: '/register',
        name: 'Register',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => RegisterPage(key: state.pageKey),
      ),
    ],
    redirect: (context, state) async {
      String? token = await fss.read(key: 'accessToken');

      bool isAuth = token != null;

      if (!isAuth &&
          state.fullPath != '/register' &&
          state.fullPath != '/login') {
        return '/login';
      }
      if (isAuth && state.fullPath == '/login') {
        return '/home';
      }

      return null;
    },
  );
}
