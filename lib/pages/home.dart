import 'package:flutter/material.dart';
import 'package:nativeco/pages/fragments/chat_fragment.dart';
import 'package:nativeco/pages/fragments/home_fragment.dart';
import 'package:nativeco/pages/fragments/add_item_fragment.dart';
import 'package:nativeco/pages/fragments/products_fragment.dart';
import 'package:nativeco/pages/fragments/profile_fragment.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Current index for the tab
  final List<Widget> _screens = [
    HomeFragment(),
    ChatFragment(),
    NewFragment(),
    ProductsFragment(),
    ProfileFragment(),
  ]; // List of your screens

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed type for more than 3 items
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
