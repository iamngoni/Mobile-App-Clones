import 'package:fiab/cart.dart';
import 'package:fiab/categories.dart';
import 'package:fiab/colors.dart';
import 'package:fiab/home.dart';
import 'package:fiab/provider.dart';
import 'package:fiab/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FiabBase extends StatefulWidget {
  @override
  _FiabBaseState createState() => _FiabBaseState();
}

class _FiabBaseState extends State<FiabBase> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _pages = [FiabCategories(), FiabHome(), FiabSearch(), FiabCart()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FiabProvider(),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shoppingBag),
              title: Text('Shop'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shoppingCart),
              title: Text("Cart"),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: green,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          backgroundColor: Colors.grey,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: floatingButtonGreen,
          child: FaIcon(FontAwesomeIcons.facebookMessenger),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Fresh In My Box",
            style: TextStyle(
              color: dark,
            ),
          ),
          centerTitle: true,
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
