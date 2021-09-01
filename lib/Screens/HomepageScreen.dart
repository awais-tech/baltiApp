import 'package:balti/Model/meal.dart';
import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Screens/addtocart.dart';
import 'package:balti/Widgets/badge.dart';

import 'package:balti/Widgets/BlaltiMealItem.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class HomeScreen extends StatefulWidget {
  static final route = '/Home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final loadedMenu = Provider.of<BaltiMeals>(
      context,
      listen: false,
    );
    final products =
        _showOnlyFavorites ? loadedMenu.favoriteItems : loadedMenu.items;
    List<Meal> allMenu = loadedMenu.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: <Widget>[
          PopupMenuButton(
            color: Colors.yellow,
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Badge(
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Mycart.route,
                );
              },
            ),
            value: '4',
            color: Colors.yellow,
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 280,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: products[index],
                        child: Container(
                          width: 300.0,
                          child: BaltiItem(),
                        ));
                  },
                  itemCount: products.length,
                ),
              ),
              Container(
                // child: Container(
                //     color: Colors.white,
                //     child: GridView.builder(
                //       shrinkWrap: true,
                //       physics: NeverScrollableScrollPhysics(),
                //       itemCount: allMenu.length,
                //       itemBuilder: (ctx, index) => BaltiItem(
                //           allMenu[index].id,
                //           allMenu[index].title,
                //           allMenu[index].imageUrl,
                //           allMenu[index].duration,
                //           allMenu[index].Dilvery,
                //           allMenu[index].Category,
                //           allMenu[index].ResturentName),
                //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2,
                //         childAspectRatio: 1,
                //         crossAxisSpacing: 4,
                //         mainAxisSpacing: 4,
                //       ),
                //     )
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: products[index],
                        child: Container(
                          width: 300.0,
                          child: BaltiItem(),
                        ));
                  },
                  itemCount: products.length,
                ),
              ),
            ],
          ),
        ),
      ),

      // body: Container(
      //   color: Colors.white,
      //   child: ListView.builder(
      //     itemBuilder: (ctx, index) {
      //       return BaltiItem(
      //           allMenu[index].id,
      //           allMenu[index].title,
      //           allMenu[index].imageUrl,
      //           allMenu[index].duration,
      //           allMenu[index].Dilvery,
      //           allMenu[index].Category,
      //           allMenu[index].ResturentName);
      //     },
      //     itemCount: allMenu.length,
      //   ),
      // ),
    );
  }
}
