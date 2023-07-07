import 'package:final_flutter_project/components/text_field.dart';
import 'package:final_flutter_project/screen_routes.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscureText = true;
  bool isChecked = false;
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailadressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
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
                'Register Account',
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
                controller: _firstnameController,
                decoration: InputDecoration(
                  hintText: 'First Name',
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
                controller: _lastnameController,
                decoration: InputDecoration(
                  hintText: 'Last Name',
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
                controller: _emailadressController,
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
              padding: const EdgeInsets.only(top: 15, left: 17, right: 17),
              child: CustomTextField(
                controller: _confirmpasswordController,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
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
              padding: const EdgeInsets.only(top: 15, right: 7, left: 7),
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.green,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    side: const BorderSide(color: Colors.green),
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions & Privacy Policy ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: 'set out by this site',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(360, 60)),
              ),
              onPressed: () {},
              child: const Text(
                'Register',
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
              height: 130,
              image: AssetImage('assets/images/img_social.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
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
      ),
    );
  }
}
