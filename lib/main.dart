import 'package:auth_app_koffiesoft/core/local/shared_pref_helper.dart';
import 'package:auth_app_koffiesoft/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferenceHelper().initialize();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  // final GoRouter router;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: AppRouter.routes,
      debugShowCheckedModeBanner: false,
    );  
  }
}
