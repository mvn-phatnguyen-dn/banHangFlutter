import 'package:final_flutter_project/components/text_field.dart';
import 'package:final_flutter_project/screen_routes.dart';
import 'package:final_flutter_project/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import '../../base/base_page.dart';
import '../../network/api_service.dart';
import '../../network/entity/product_entity.dart';
import 'home_viewmodel.dart';

class HomeScreen extends BasePage<HomeViewModel> {
  const HomeScreen({super.key, required super.viewModel});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BasePageState<HomeScreen> {
  final _searchplantController = TextEditingController();
  List<ProductEntity> listProduct = [];
  ApiService apiService = ApiService(dio.Dio());
  HomeViewModel get _viewModel => widget.viewModel;

  Future<void> _getInfoUser() async {
    try {
      final response = await apiService.infoUser();
      await prefs.setString('userName', response.infoUserEntity.userName);
      await prefs.setString('userPhone', response.infoUserEntity.phoneNumber);
      await prefs.setString('address', response.infoUserEntity.address);
      await prefs.setString('password', 'Phat123');
      print(prefs.getString('userName'));
      print(prefs.getString('userPhone'));
      print(prefs.getString('address'));
      print(prefs.getString('password'));
    } catch (error) {
      showDefaultAlert(context);
    }
  }

  Future<void> _getListProduct() async {
    try {
      final response = await apiService.getListProduct();
      setState(() {
        listProduct = response.listProductEntity;
      });
    } catch (error) {
      showDefaultAlert(context);
    }
  }

  @override
  void initState() {
    _getListProduct();
    _getInfoUser();
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
                    Icons.search,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(items: listProduct),
                      ),
                    );
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
                itemCount: listProduct.length % 15,
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
                                      listProduct[index].name.split(' ').first,
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
                                        icon: const Icon(Icons.heart_broken),
                                        onPressed: () async {
                                          print('add to favorite');
                                          List<String> listFavoriteId =
                                              prefs.getStringList('favorite')!;
                                          listFavoriteId.add(
                                              listProduct[index].id.toString());
                                          print(listFavoriteId);
                                          await prefs.setStringList(
                                              'favorite', listFavoriteId);
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
              itemCount: listProduct.length % 13,
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
                                      listProduct[index].name.split(' ').first,
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
                                      '\$${listProduct[index].price}' ?? '',
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
                                        icon: const Icon(Icons.heart_broken),
                                        onPressed: () async {
                                          print('add to cart dưới');
                                          List<String> listFavoriteId =
                                              prefs.getStringList('favorite')!;
                                          listFavoriteId.add(
                                              listProduct[index].id.toString());
                                          print(listFavoriteId);
                                          await prefs.setStringList(
                                              'favorite', listFavoriteId);
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
        content: const Text('API has error.'),
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
