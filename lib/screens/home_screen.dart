import 'package:final_flutter_project/components/text_field.dart';
import 'package:final_flutter_project/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import '../network/api_service.dart';
import '../network/entity/product_entity.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    // _getListProduct();
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchplantController = TextEditingController();
  List<ProductEntity> listProduct = [];
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

  Future<void> _getListProduct() async {
    try {
      final response = await apiService.getListProduct();
      listProduct = response.listProductEntity;
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

  // List<Map<String, dynamic>> dummyData = [
  //   {
  //     "id": 16,
  //     "category_id": 12,
  //     "name": "Santal Royal",
  //     "name_category": "Perfume",
  //     "image_product":
  //         "http://localhost:8000/storage/shop/product/1666973112_santal_royal_1.png",
  //     "discount": 0,
  //     "content":
  //         "When you're flying across the field or sprinting around the track, you can't afford to have hair block your view. This adidas headband comes to the rescue with breathable fabric that's stretchy and moisture-proof. Tie it at the back, and be on your way.",
  //     "price": 8,
  //     "view": 0,
  //     "created_at": "2022-10-28T14:54:09.000000Z",
  //     "updated_at": "2022-10-28T14:54:09.000000Z"
  //   },
  //   {
  //     "id": 16,
  //     "category_id": 12,
  //     "name": "Alphaskin Tie",
  //     "name_category": "Perfume",
  //     "image_product":
  //         "http://localhost:8000/storage/shop/product/1666973055_samsara_1.png",
  //     "discount": 0,
  //     "content":
  //         "When you're flying across the field or sprinting around the track, you can't afford to have hair block your view. This adidas headband comes to the rescue with breathable fabric that's stretchy and moisture-proof. Tie it at the back, and be on your way.",
  //     "price": 20,
  //     "view": 0,
  //     "created_at": "2022-10-28T14:54:09.000000Z",
  //     "updated_at": "2022-10-28T14:54:09.000000Z"
  //   },
  //   {
  //     "id": 16,
  //     "category_id": 12,
  //     "name": "Samsara",
  //     "name_category": "Perfume",
  //     "image_product":
  //         "http://localhost:8000/storage/shop/product/1666972892_extract_1.png",
  //     "discount": 0,
  //     "content":
  //         "When you're flying across the field or sprinting around the track, you can't afford to have hair block your view. This adidas headband comes to the rescue with breathable fabric that's stretchy and moisture-proof. Tie it at the back, and be on your way.",
  //     "price": 15,
  //     "view": 0,
  //     "created_at": "2022-10-28T14:54:09.000000Z",
  //     "updated_at": "2022-10-28T14:54:09.000000Z"
  //   },
  // ];

  @override
  void initState() {
    _getListProduct();
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
                IconButton(
                  icon: const Icon(
                    Icons.grid_view_rounded,
                    color: Colors.green,
                    size: 35,
                  ),
                  onPressed: () {
                    print('home home');
                  },
                ),
                const SizedBox(width: 249),
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
                IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    print('tap notification');
                  },
                )
              ],
            ),
            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.all(9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Good Morning 👋',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Find Your Favourite Plants Here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: CustomTextField(
                controller: _searchplantController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 105, 102, 102),
                    fontSize: 18,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 19, 17, 17),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Most Popular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 3,
                  crossAxisCount: 1,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ScreenRoutes.screenDetailProduct,
                          arguments: listProduct[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 23, 22, 22),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: const Color.fromARGB(255, 38, 39, 40),
                                child: Image.network(
                                  listProduct[index].imageProduct,
                                  height: 170,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      listProduct[index].name,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      listProduct[index].categoryId.toString(),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${listProduct[index].price.toString()}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: IconButton(
                                        color: Colors.white,
                                        icon:
                                            const Icon(Icons.add_shopping_cart),
                                        onPressed: () {
                                          print('add to cart');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New Items',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ScreenRoutes.screenDetailProduct,
                        arguments: listProduct[index]);
                  },
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
                                  listProduct[index].imageProduct,
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
                                      listProduct[index].name,
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
                                      listProduct[index].categoryId.toString(),
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
                                      '\$${listProduct[index].price}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: IconButton(
                                        color: Colors.white,
                                        icon:
                                            const Icon(Icons.add_shopping_cart),
                                        onPressed: () {
                                          print('add to cart dưới');
                                        },
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
