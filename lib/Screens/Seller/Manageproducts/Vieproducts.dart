import 'dart:convert';

import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Screens/Constants.dart';
import 'package:balti/Screens/Seller/AddProduct.dart';
import 'package:balti/Widgets/Mnageproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class UserProductsScreen extends StatefulWidget {

//   @override
//   _UserProductsScreenState createState() => _UserProductsScreenState();
// }

class UserProductsScreen extends StatefulWidget {
  // var _showOnlyFavorites = false;
  // var _isInit = true;
  // var _isLoading = false;
  static const routeName = '/user-products';

  @override
  State<UserProductsScreen> createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
  var _isInit = true;
  var _isLoading = true;
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

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<BaltiMeals>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<BaltiMeals>(context).findowner(
        json.decode(Constants.prefs.getString('userData') as String)['userId']);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffB788E5),
          title: const Text('Your Products'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddProductScreen.routeName);
                ;
              },
            ),
          ],
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () => _refreshProducts(context),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    itemCount: productsData.length,
                    itemBuilder: (_, i) => Column(
                      children: [
                        UserProductItem(
                          productsData[i].title,
                          productsData[i].imageUrl,
                          productsData[i].id,
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
