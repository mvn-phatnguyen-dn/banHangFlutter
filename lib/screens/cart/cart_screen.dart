import 'package:final_flutter_project/network/entity/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import '../../base/base_page.dart';
import '../../network/api_service.dart';
import 'cart_screen_viewmodel.dart';

class CartScreen extends BasePage<CartViewModel> {
  const CartScreen({super.key, required super.viewModel});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends BasePageState<CartScreen> {
  ApiService apiService = ApiService(dio.Dio());
  List<CartEntity> data = [];
  int totalAmount = 0;

  Future<void> _createTransaction() async {
    try {
      print(data.map((e) => e.id).toList());
      print(prefs.getString('userName'));
      print(prefs.getString('userPhone'));
      print(prefs.getString('address'));
      print(totalAmount);
      print(prefs.getString('password'));
      final response = await apiService.createTransaction({
        "orders": data.map((e) => e.id).toList(),
        "user_name": prefs.getString('userName') ?? 'no_userName',
        "user_phone": prefs.getString('userPhone') ?? 'no_userPhone',
        "address": prefs.getString('address') ?? 'no_address',
        "amount": totalAmount,
        "password": prefs.getString('address') ?? 'no_password',
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text(response.data.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    data = [];
                  });
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

  Future<void> _deleteCartItem(String id) async {
    try {
      final response = await apiService.deleteItemCart(id);
      _getCart();
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

  Future<void> _getCart() async {
    try {
      final response = await apiService.getCart();
      setState(() {
        data = response.allCartEntity;
        totalAmount = data
            .map((e) => e.price * e.quantity)
            .reduce((value, element) => (value + element));
      });
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text('Your Cart is Empty'),
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
  void initState() {
    _getCart();
    super.initState();
  }

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
              itemCount: data.length,
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
                                  data[index].imageProduct,
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
                                      data[index].productName,
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
                                      data[index].createdAt.split('T').first,
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
                                      '\$${data[index].price}',
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
                                          _deleteCartItem(
                                              data[index].id.toString());
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
                                      data[index].quantity.toString(),
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
                        '${totalAmount} dollar',
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
                        '0%',
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
                        '0 dollar',
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
                        '${totalAmount} dollar',
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
                    onPressed: () {
                      _createTransaction();
                    },
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

  @override
  void bind() {
    // TODO: implement bind
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
