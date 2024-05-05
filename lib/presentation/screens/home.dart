import 'package:auth_app_koffiesoft/constant/routes_path_constant.dart';
import 'package:auth_app_koffiesoft/core/local/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    // print(context.read<AuthService>()._isAuthenticated);
    return  Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            SharedPreferenceHelper().clearAll();
            setState(() {
              context.go(RoutePathConstant.loginRoutePath);
            });
            
          },
          child: const Text('Welcome'),),
      ),
    );
  }
}