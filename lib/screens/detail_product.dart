import 'package:final_flutter_project/components/text_field.dart';
import 'package:final_flutter_project/network/entity/product_entity.dart';
import 'package:final_flutter_project/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import '../network/api_service.dart';
import '../network/response/add_to_cart_input_model.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  final _searchplantController = TextEditingController();
  late ProductEntity item;
  int numberProducts = 1;

  ApiService apiService = ApiService(dio.Dio());

  Future<void> _addToCart() async {
    try {
      final response = await apiService
          .addToCart('${item.id}', {'quantity': numberProducts});
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text(response.data.toString()),
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
    item = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      backgroundColor: Colors.black,
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
              item.imageProduct,
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
                    item.name,
                  ),
                  Row(children: [
                    Text(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        '${item.view} reviewers'),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    item.content,
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
                                'Code'),
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                '${item.categoryId}')
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
                                'Discount'),
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                '${item.discount} %')
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
                                'Date create'),
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                '${item.createdAt.split('T').first}')
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
                                'Date update'),
                            Text(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                '${item.updatedAt.split('T').first}')
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
                          ' price: '),
                      Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 166, 14),
                              fontSize: 30),
                          '${item.price * numberProducts}\$'),
                      TextButton(
                        onPressed: () {
                          if (numberProducts > 1) {
                            setState(() {
                              numberProducts -= 1;
                            });
                          }
                        },
                        child: Text(
                            style: TextStyle(color: Colors.white, fontSize: 40),
                            '-'),
                      ),
                      Text(
                          style: TextStyle(
                              color: Color.fromARGB(255, 161, 3, 3),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          numberProducts.toString()),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            numberProducts += 1;
                          });
                        },
                        child: Text(
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            '+'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('add to cart detail');
                      _addToCart();
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
