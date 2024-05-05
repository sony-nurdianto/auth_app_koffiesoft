// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/the_app_is_running.dart';
import './step/i_see_text.dart';

void main() {
  group('''Login Screen''', () {

    setUpAll(() async => dotenv.load());

    testWidgets(''' There are Welcome Text''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Welcome To Our App');
    });
    testWidgets('''There are Login Text''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Login To Your Acount');
    });
    testWidgets('''There are Email Text Field''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Email');
    });
    testWidgets('''There are passwod Text Field''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Password');
    });
    testWidgets('''There are button Text Field''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Login');
    });
    testWidgets('''There are asking acount Text''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Don\'t have an account ?');
    });
    testWidgets('''There are register Text''', (tester) async {
      await theAppIsRunning(tester);
      await iSeeText(tester, 'Register');
    });
  });
}
