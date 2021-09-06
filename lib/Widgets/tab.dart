import 'package:balti/Provider/cart.dart';
import 'package:balti/Screens/HomepageScreen.dart';
import 'package:balti/Screens/addtocart.dart';
import 'package:balti/Widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
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
        'Pages': 2,
        'title': 'Explore',
      },
      {
        'Pages': Mycart(),
        'title': 'Cart',
      },
      {
        'Pages': 2,
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
        backgroundColor: Colors.pink[900],
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink[900],
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink[900],
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink[900],
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
            backgroundColor: Colors.pink[900],
            icon: Icon(Icons.settings),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
