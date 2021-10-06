import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Widgets/Mnageproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class UserProductsScreen extends StatefulWidget {

//   @override
//   _UserProductsScreenState createState() => _UserProductsScreenState();
// }

class UserProductsScreen extends StatelessWidget {
  // var _showOnlyFavorites = false;
  // var _isInit = true;
  // var _isLoading = false;
  static const routeName = '/user-products';

  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<BaltiMeals>(context).fetchAndSetProducts().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<BaltiMeals>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    print(222);
    final productsData = Provider.of<BaltiMeals>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffB788E5),
          title: const Text('Your Products'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed('Your Products');
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => _refreshProducts(context),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: productsData.items.length,
              itemBuilder: (_, i) => Column(
                children: [
                  UserProductItem(
                    productsData.items[i].title,
                    productsData.items[i].imageUrl,
                    productsData.items[i].id,
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ));
  }
}
