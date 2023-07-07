import 'package:final_flutter_project/screen_routes.dart';
import 'package:final_flutter_project/screens/home_screen.dart';
import 'package:final_flutter_project/screens/login_screen.dart';
import 'package:final_flutter_project/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedPreferences prefs = SharedPreferencesService().prefs;
    return MaterialApp(
      home: prefs.getString('token') == null ? LoginScreen() : HomeScreen(),
      routes: {
        ScreenRoutes.screenHome: (context) => const HomeScreen(),
        ScreenRoutes.screenLogin: (context) => const LoginScreen(),
        ScreenRoutes.screenSignup: (context) => const SignupScreen(),
      },
    );
  }
}
