import 'package:balti/Provider/cart.dart';
import 'package:balti/Screens/Buyer/Accounts/Account.dart';
import 'package:balti/Screens/Buyer/Explore.dart';
import 'package:balti/Screens/Buyer/HomepageScreen.dart';
import 'package:balti/Screens/Buyer/checkout/addtocart.dart';
import 'package:balti/Widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  static final route = 'tabsScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {
        'Pages': HomeScreen(),
        'title': 'Home',
      },
      {
        'Pages': Explore(),
        'title': 'Explore',
      },
      {
        'Pages': Mycart(),
        'title': 'Cart',
      },
      {
        'Pages': Account(),
        'title': 'Account',
      }
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['Pages'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Color(0xffB788E5),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xff8d43d6),
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xffB788E5),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xffB788E5),
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xffB788E5),
            icon: Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cart.itemCount.toString(),
                color: Colors.amber,
              ),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xffB788E5),
            icon: Icon(Icons.settings),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
