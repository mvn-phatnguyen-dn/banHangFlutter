import 'package:final_flutter_project/components/text_field.dart';
import 'package:final_flutter_project/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import '../network/api_service.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  final _searchplantController = TextEditingController();
  int _currentIndex = 0;
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
      backgroundColor: Color.fromARGB(255, 38, 39, 40),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 25),
            Image.network(
              'http://localhost:8000/storage/shop/product/1666972892_extract_1.png',
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black,
              height: 450,
              width: 390,
              child: Column(
                children: [
                  Text(
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    'Name of Product',
                  ),
                  Row(children: [
                    Text(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        '146 reviewers'),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    'chi tiết product chi tiết product chi tiết product chi tiết product chi tiết product chi tiết product chi tiết product chi tiết product chi tiết product chi tiết product chi tiết product',
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                          style: TextStyle(
                            color: Colors.green,
                          ),
                          'read more')),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        child: Column(
                          children: [
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                'Read more'),
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                'read more')
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        child: Column(
                          children: [
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                'Read more'),
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                'read more')
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        child: Column(
                          children: [
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                'Read more'),
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                'read more')
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        child: Column(
                          children: [
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                'Read more'),
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                'read more')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          '60000vnd'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            '-'),
                      ),
                      Text(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          '11'),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            '+'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('add to cart detail');
                    },
                    child: Container(
                      color: Colors.green,
                      height: 50,
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 35,
                          ),
                          Text(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              'Add To Cart'),
                          SizedBox(width: 50),
                          Container(
                            width: 2,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              '60000 vnd')
                        ],
                      ),
                    ),
                  )
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
