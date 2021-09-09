import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Provider/cart.dart';
import 'package:balti/Screens/Checkout.dart';
import 'package:balti/Screens/DetailScreen.dart';
import 'package:balti/Screens/HomepageScreen.dart';
import 'package:balti/Screens/addtocart.dart';
import 'package:balti/Screens/login%20screen%201%20(2).dart';
import 'package:balti/Screens/signup%20(1).dart';
import 'package:balti/Screens/splash.dart';
import 'package:balti/Widgets/tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => BaltiMeals(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
        ],
        child: MaterialApp(
            title: 'BaltiApp',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Splash(),
            routes: {
              Mysignuppage.route: (ctx) => Mysignuppage(),
              HomeScreen.route: (ctx) => TabsScreen(),
              Mycart.route: (ctx) => Mycart(),
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CheckoutScreen.route: (ctx) => CheckoutScreen()
            }));
  }
}
