import 'dart:ui';

import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Provider/cart.dart';
import 'package:balti/Provider/feedback.dart';
import 'package:balti/Screens/Buyer/Rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
    return FutureBuilder(
        future: Provider.of<Feedbacks>(context, listen: false)
            .fetchAndSetProducts(true, loadedProduct.id, 'prod'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(loadedProduct.title),
                  backgroundColor: Color(0xffB788E5),
                ),
                body: Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(loadedProduct.ResturentName),
                backgroundColor: Color(0xffB788E5),
              ),
              body: Container(
                decoration: BoxDecoration(color: Color(0xffB788E5)),
                child: Column(
                  children: <Widget>[
                    ClipPath(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://mir-s3-cdn-cf.behance.net/project_modules/disp/496ecb14589707.562865d064f9e.png"))),
                        height: screenWidth.height * 0.75,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18),
                              topLeft: Radius.circular(18),
                            ),
                          ),
                          elevation: 20,
                          margin: EdgeInsets.only(
                              top: 50, left: 20, right: 20, bottom: 10),
                          child: ListView(
                            children: <Widget>[
                              SizedBox(height: 20),
                              Container(
                                height: 200,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Image.network(loadedProduct.imageUrl,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      loadedProduct.title,
                                      //textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      'Rs ${loadedProduct.price}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Wrap(
                                    spacing: 5,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.category,
                                        size: 12,
                                        color: Colors.amber,
                                      ),
                                      Text(loadedProduct.Category,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Wrap(
                                    spacing: 5,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        size: 12,
                                        color: Colors.red,
                                      ),
                                      Text('${loadedProduct.duration} Minutes',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Consumer<Feedbacks>(
                                    builder: (ctx, feedbackData, child) =>
                                        TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            Rating.routename,
                                            arguments: loadedProduct.id);
                                      },
                                      child: RatingBarIndicator(
                                        rating: feedbackData.total + 0.0,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
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
                      ),
                      clipper: CustomClipPath(),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 10)),

                        backgroundColor: MaterialStateProperty.all(
                            Color(0xff8d43d6)), // <-- Button color
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          if (states.contains(MaterialState.pressed))
                            return Color(0xffB788E5); // <-- Splash color
                        }),
                      ),
                      child: Text(
                        "Add To Cart",
                      ),
                      onPressed: () {
                        cart.addItem(loadedProduct.id, loadedProduct.price,
                            loadedProduct.title, loadedProduct.createdby);
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
              ),
            );
          }
        });
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
