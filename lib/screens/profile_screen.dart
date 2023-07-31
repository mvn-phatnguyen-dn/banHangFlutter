import 'package:final_flutter_project/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import '../network/api_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ApiService apiService = ApiService(dio.Dio());

  Future<void> _logout() async {
    try {
      final response = await apiService.logout();
      print('============> logout');
      await prefs.remove('token');
      await Navigator.popAndPushNamed(context, ScreenRoutes.screenLogin);
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                SizedBox(
                  width: 150,
                ),
                Text(
                  'My Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  child: Stack(
                    children: [
                      Image.network(
                          "http://localhost:8000/storage/shop/product/1666972892_extract_1.png"),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_enhance,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      prefs.getString('userName') ?? 'no_name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      prefs.getString('userPhone') ?? 'no_phone',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      prefs.getString('address') ?? 'no_address',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Genaral',
                    style: TextStyle(
                      color: Color.fromARGB(255, 80, 69, 69),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Setting',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 180,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.history,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 180,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Private',
                    style: TextStyle(
                      color: Color.fromARGB(255, 80, 69, 69),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.comment_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Terms  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 180,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.privacy_tip,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Privacy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 180,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _logout();
              },
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      _logout();
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      _logout();
                    },
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

void showDefaultAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: const Text('This is a default alert.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
