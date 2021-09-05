import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size;
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<BaltiMeals>(
      context,
      listen: false,
    ).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: screenWidth.height * 0.75,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 250,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: Image.network(loadedProduct.imageUrl,
                      fit: BoxFit.contain),
                ),
                Divider(),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Rs ${loadedProduct.price}',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    loadedProduct.title,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20)),

              backgroundColor: MaterialStateProperty.all(
                  Colors.pink[900]), // <-- Button color
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.red; // <-- Splash color
              }),
            ),
            child: Text(
              "Add To Cart",
            ),
            onPressed: () {
              cart.addItem(
                  loadedProduct.id, loadedProduct.price, loadedProduct.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added item to cart!',
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(loadedProduct.id);
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
