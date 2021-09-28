import 'package:balti/Model/meal.dart';
import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Screens/Seller/Dashboard.dart';
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
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<BaltiMeals>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loadedMenu = Provider.of<BaltiMeals>(
      context,
      listen: true,
    );
    final products =
        _showOnlyFavorites ? loadedMenu.favoriteItems : loadedMenu.items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: FittedBox(fit: BoxFit.fitWidth, child: Text('Home')),
        actions: <Widget>[
          PopupMenuButton(
            color: Colors.white,
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.map_outlined),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Column(
                  children: [
                    Text('Change Location'),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Location',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    )
                  ],
                ),
                value: FilterOptions.Favorites,
              ),
            ],
          ),
          PopupMenuButton(
            color: Colors.pink,
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

          // Badge(
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.shopping_cart,
          //     ),
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(
          //         Mycart.route,
          //       );
          //     },
          //   ),
          //   value: '4',
          //   color: Colors.yellow,
          // ),
          ElevatedButton(
            onPressed: () => {
              Navigator.of(context)
                  .pushReplacementNamed(Sellerdashboard.routeName)
            },
            style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(width: 1, color: Colors.black38)),
                backgroundColor: MaterialStateProperty.all(Colors.pink[900])),
            child: FittedBox(
                fit: BoxFit.fitWidth, child: Text('Switch to Seller')),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'New Businesses in Town',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      height: 240,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return ChangeNotifierProvider.value(
                              value: products[index],
                              child: Container(
                                width: 220.0,
                                child: BaltiItem(),
                              ));
                        },
                        itemCount: products.length,
                      ),
                    ),
                    Container(
                      child: Container(
                          color: Colors.white,
                          child: OrientationBuilder(
                            builder: (BuildContext context,
                                Orientation orientation) {
                              return new GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: products.length,
                                itemBuilder: (ctx, index) {
                                  return ChangeNotifierProvider.value(
                                    value: products[index],
                                    child: BaltiItem(),
                                  );
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? 2
                                          : 4,
                                  // MediaQuery.of(context).size.width /
                                  // (MediaQuery.of(context).size.height / 1.4)
                                  childAspectRatio:
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? 1 / 1.3
                                          : 1 / 1.1,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4,
                                ),
                              );
                            },
                          )
                          // child: ListView.builder(
                          //   cacheExtent: 9999,
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   itemBuilder: (ctx, index) {
                          //     return ChangeNotifierProvider.value(
                          //       value: products[index],
                          //       child: Container(
                          //         width: 300.0,
                          //         child: BaltiItem(),
                          //       ),
                          //     );
                          //   },
                          //   itemCount: products.length,
                          // ),
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
