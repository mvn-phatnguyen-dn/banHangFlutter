import 'package:final_flutter_project/screen_routes.dart';
import 'package:flutter/material.dart';
import '../network/entity/product_entity.dart';

class SearchScreen extends StatefulWidget {
  List<ProductEntity> items = [];

  SearchScreen({Key? key, required this.items}) : super(key: key);

  @override
  State<SearchScreen> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchplantController = TextEditingController();
  String _searchText = '';
  final List<ProductEntity> _searchResult = [];

  void _performSearch(String searchText) {
    _searchResult.clear();

    // if (searchText.isEmpty) {
    //   setState(() {});
    //   return;
    // }

    for (var item in widget.items) {
      if (item.name.toLowerCase().contains(searchText.toLowerCase())) {
        _searchResult.add(item);
      }
    }

    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {
              Navigator.pop(context, ScreenRoutes.screenHome);
            },
          ),
          TextField(
            controller: _searchplantController,
            onChanged: (value) {
              setState(() {
                _searchText = value;
                _performSearch(_searchText);
              });
            },
            decoration: const InputDecoration(
              prefixIconColor: Colors.black,
              labelText: 'Input Here',
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            height: 550,
            color: Color.fromARGB(255, 255, 255, 255),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              itemCount: _searchResult.length,
              itemBuilder: (context, index) {
                final item = _searchResult[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ScreenRoutes.screenDetailProduct,
                        arguments: _searchResult[index]);
                  },
                  child: ListTile(
                    leading: Image.network(item.imageProduct),
                    title: Text(
                      'Price: ${item.price} dollars',
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 214, 51),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Name: ${item.name}',
                      style: TextStyle(
                        color: Color.fromRGBO(3, 34, 105, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
