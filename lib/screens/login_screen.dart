import 'package:final_flutter_project/components/text_field.dart';
import 'package:final_flutter_project/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:final_flutter_project/network/api_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import '../common/shared_preferences_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ApiService apiService = ApiService(dio.Dio());

  bool obscureText = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final SharedPreferences prefs = SharedPreferencesService().prefs;

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final Map<String, dynamic> loginData = {
      'email': username,
      'password': password
    };

    try {
      final response = await apiService.login(loginData);
      await prefs.setString('token',
          '${response.userEntity.tokenType} ${response.userEntity.accessToken}');
      print('${response.toJson()}');
      // Obtain shared preferences.
      print('login ============> token');
      print(prefs.getString('token'));
      await Navigator.popAndPushNamed(context, ScreenRoutes.screenRoot);
    } catch (error) {
      showDefaultAlert(context);
      if (error is dio.DioException) {
        if (error.response?.statusCode == 400) {
          // Xử lý lỗi 400
        } else if (error.response?.statusCode == 401) {
          // Xử lý lỗi 401
        }
        // Xử lý các lỗi khác
      } else {
        // Xử lý các lỗi khác
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, right: 260),
            child: const Image(
              width: 100,
              height: 100,
              image: AssetImage('assets/images/img_character_p.png'),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 95, top: 20),
            child: const Text(
              'Welcome Back 👋',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 210),
            child: RichText(
              text: const TextSpan(
                text: 'to ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'PLANT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.only(right: 105),
            child: const Text(
              'Hello there, login to continue',
              style: TextStyle(
                color: Color.fromARGB(255, 125, 122, 122),
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 17),
            child: CustomTextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Email Address',
                hintStyle: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
              obscureText: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 17, right: 17),
            child: CustomTextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
              obscureText: obscureText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password ?',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              minimumSize: MaterialStateProperty.all<Size>(const Size(360, 60)),
            ),
            onPressed: _login,
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 10, left: 10),
            child: Row(
              children: [
                Container(
                  height: 1,
                  width: 40,
                  color: const Color.fromARGB(255, 150, 144, 144),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Or continue with social account',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 1,
                  width: 40,
                  color: const Color.fromARGB(255, 150, 144, 144),
                ),
              ],
            ),
          ),
          const Image(
            width: 350,
            height: 150,
            image: AssetImage('assets/images/img_social.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                const Text(
                  "Didn't have an account?",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenRoutes.screenSignup);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showDefaultAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Text('This is a default alert.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
