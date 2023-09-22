import 'package:final_flutter_project/screen_routes.dart';
import 'package:final_flutter_project/screens/detail/detail_product.dart';
import 'package:final_flutter_project/screens/home/home_screen.dart';
import 'package:final_flutter_project/screens/login/loginViewModel.dart';
import 'package:final_flutter_project/screens/login/login_screen.dart';
import 'package:final_flutter_project/screens/root_screen.dart';
import 'package:final_flutter_project/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/shared_preferences_service.dart';
import 'screens/home/home_viewmodel.dart';

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
      home: prefs.getString('token') == null
          ? LoginScreen(viewModel: LoginViewModel())
          : RootScreen(),
      routes: {
        ScreenRoutes.screenRoot: (context) => const RootScreen(),
        ScreenRoutes.screenHome: (context) =>
            HomeScreen(viewModel: HomeViewModel()),
        ScreenRoutes.screenLogin: (context) =>
            LoginScreen(viewModel: LoginViewModel()),
        ScreenRoutes.screenSignup: (context) => const SignupScreen(),
        ScreenRoutes.screenDetailProduct: (context) =>
            DetailProductScreen(viewModel: DetailViewModel()),
      },
    );
  }
}
