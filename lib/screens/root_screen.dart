import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:final_flutter_project/screens/cart/cart_screen.dart';
import 'package:final_flutter_project/screens/favorite_screen.dart';
import 'package:final_flutter_project/screens/home/home_screen.dart';
import 'package:final_flutter_project/screens/order_history_screen.dart';
import 'package:final_flutter_project/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'cart/cart_screen_viewmodel.dart';
import 'home/home_viewmodel.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(viewModel: HomeViewModel()),
    CartScreen(viewModel: CartViewModel()),
    const FavoriteScreen(),
    const OrderHistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
        activeColor: Colors.green,
        curveSize: 70,
        color: Colors.white,
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(icon: Icons.home, title: ''),
          TabItem(icon: Icons.add_shopping_cart, title: ''),
          TabItem(icon: Icons.heart_broken, title: ''),
          TabItem(icon: Icons.history, title: ''),
          TabItem(icon: Icons.perm_identity, title: ''),
        ],
        initialActiveIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
