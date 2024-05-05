import 'package:auth_app_koffiesoft/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:auth_app_koffiesoft/main.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: LoginScreen(),));
}
