import 'package:auth_app_koffiesoft/constant/routes_path_constant.dart';
import 'package:auth_app_koffiesoft/core/local/shared_pref_helper.dart';
import 'package:auth_app_koffiesoft/presentation/screens/home.dart';
import 'package:auth_app_koffiesoft/presentation/screens/login.dart';
import 'package:auth_app_koffiesoft/presentation/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// final _key = GlobalKey<NavigatorState>();
// final prefs =  SharedPreferenceHelper().getString('access_token');



class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter routes = GoRouter(
    // initialLocation: '/login',
    // navigatorKey: _key,
    debugLogDiagnostics: true,
    // refreshListenable: GoRouterRe,
    navigatorKey: _rootNavigatorKey,
    // refreshListenable: ,
    routes: [
      GoRoute(
        path: '/login',
        // path: RoutePathConstant.loginRoutePath,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RoutePathConstant.registerRoutePath,
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        // path: RoutePathConstant.homeRoutePath,
        path: '/',
        name: 'home',
        builder: (context, state) {
          return const HomePageScreen();
        },
        redirect: (BuildContext context,GoRouterState state)  {
           String? autenticated = SharedPreferenceHelper().getString('access_token');
           if(autenticated != null) {
            return '/';
           } else {
            return '/login';
           }
        },
      )
    ],
  );
}
