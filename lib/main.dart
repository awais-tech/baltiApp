import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Provider/cart.dart';
import 'package:balti/Provider/orders.dart';
import 'package:balti/Screens/Buyer/Accounts/Address.dart';
import 'package:balti/Screens/Buyer/checkout/Checkout.dart';
import 'package:balti/Screens/Seller/AddProduct.dart';
import 'package:balti/Screens/Seller/Dashboard.dart';
import 'package:balti/Screens/Buyer/DetailScreen.dart';
import 'package:balti/Screens/Buyer/HomepageScreen.dart';
import 'package:balti/Screens/Buyer/Accounts/Orderstatus.dart';
import 'package:balti/Screens/Buyer/Accounts/Profile.dart';
import 'package:balti/Screens/Buyer/Accounts/aboutus.dart';
import 'package:balti/Screens/Buyer/checkout/addtocart.dart';
import 'package:balti/Screens/Buyer/Accounts/orders_screen.dart';
import 'package:balti/Screens/Buyer/AccountAuth/signup%20(1).dart';
import 'package:balti/Screens/Buyer/AccountAuth/splash.dart';
import 'package:balti/Screens/Seller/ManageFeedbacks.dart';
import 'package:balti/Screens/Seller/Manageproducts/Vieproducts.dart';
import 'package:balti/Screens/Buyer/Accounts/feedbacks.dart';
import 'package:balti/Screens/Seller/manageorders/orderstabscreen.dart';
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
          ChangeNotifierProvider(
            create: (ctx) => Orders(),
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
              CheckoutScreen.route: (ctx) => CheckoutScreen(),
              Profile.routeName: (ctx) => Profile(),
              OrderStatus.routeName: (ctx) => OrderStatus(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              AboutUs.routeName: (ctx) => AboutUs(),
              Address.routeName: (ctx) => Address(),
              Sellerdashboard.routeName: (ctx) => Sellerdashboard(),
              UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              AddProductScreen.routeName: (ctx) => AddProductScreen(),
              FeedbackScreen.routename: (ctx) => FeedbackScreen(),
              ManageFeedbacks.routeName: (ctx) => ManageFeedbacks(),
              OrdersApprovalScreen.routeName: (ctx) => OrdersApprovalScreen(),
            }));
  }
}
