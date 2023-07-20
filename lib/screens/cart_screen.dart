import 'package:final_flutter_project/components/text_field.dart';
import 'package:final_flutter_project/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import '../network/api_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _searchplantController = TextEditingController();
  int _currentIndex = 0;
  ApiService apiService = ApiService(dio.Dio());

  List<Map<String, dynamic>> dummyData = [
    {
      "id": 16,
      "category_id": 12,
      "name": "Santal Royal",
      "name_category": "Perfume",
      "image_product":
          "http://localhost:8000/storage/shop/product/1666973112_santal_royal_1.png",
      "discount": 0,
      "content":
          "When you're flying across the field or sprinting around the track, you can't afford to have hair block your view. This adidas headband comes to the rescue with breathable fabric that's stretchy and moisture-proof. Tie it at the back, and be on your way.",
      "price": 8,
      "view": 0,
      "created_at": "2022-10-28T14:54:09.000000Z",
      "updated_at": "2022-10-28T14:54:09.000000Z"
    },
    {
      "id": 16,
      "category_id": 12,
      "name": "Alphaskin Tie",
      "name_category": "Perfume",
      "image_product":
          "http://localhost:8000/storage/shop/product/1666973055_samsara_1.png",
      "discount": 0,
      "content":
          "When you're flying across the field or sprinting around the track, you can't afford to have hair block your view. This adidas headband comes to the rescue with breathable fabric that's stretchy and moisture-proof. Tie it at the back, and be on your way.",
      "price": 20,
      "view": 0,
      "created_at": "2022-10-28T14:54:09.000000Z",
      "updated_at": "2022-10-28T14:54:09.000000Z"
    },
    {
      "id": 16,
      "category_id": 12,
      "name": "Samsara",
      "name_category": "Perfume",
      "image_product":
          "http://localhost:8000/storage/shop/product/1666972892_extract_1.png",
      "discount": 0,
      "content":
          "When you're flying across the field or sprinting around the track, you can't afford to have hair block your view. This adidas headband comes to the rescue with breathable fabric that's stretchy and moisture-proof. Tie it at the back, and be on your way.",
      "price": 15,
      "view": 0,
      "created_at": "2022-10-28T14:54:09.000000Z",
      "updated_at": "2022-10-28T14:54:09.000000Z"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                SizedBox(
                  width: 150,
                ),
                Text(
                  'My Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 23, 22, 22),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 110,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: const Color.fromARGB(255, 38, 39, 40),
                                child: Image.network(
                                  dummyData[index]['image_product'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      dummyData[index]['name'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      dummyData[index]['name_category'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${dummyData[index]['price']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red.withAlpha(10),
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: IconButton(
                                        color: Colors.red,
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          print('xoá sản phẩm');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 40,
                                child: Row(
                                  children: [
                                    Text(
                                      'Number:',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '10',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 172, 4, 4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Container(
              height: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Item total',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '1350000 vnd',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'enter coupon',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'First Plant',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border:
                                    Border.all(color: Colors.green, width: 2)),
                            width: 100,
                            height: 30,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Apply Coupon',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Discount',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 47, 173, 55),
                        ),
                      ),
                      Text(
                        '15%',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Shipping charge',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '5000 vnd',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Container(),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Grand Total',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '1800000 vnd',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(360, 60)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
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
