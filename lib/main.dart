import 'package:balti/Provider/AuthP.dart';
import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Provider/cart.dart';
import 'package:balti/Provider/feedback.dart';
import 'package:balti/Provider/orders.dart';
import 'package:balti/Provider/utilities.dart';
import 'package:balti/Screens/Buyer/AccountAuth/ForgotPassword/ForgotPasswordScreen.dart';
import 'package:balti/Screens/Buyer/AccountAuth/ForgotPassword/ResetPassword.dart';
import 'package:balti/Screens/Buyer/AccountAuth/ForgotPassword/VerifyEmail.dart';
import 'package:balti/Screens/Buyer/AccountAuth/login%20screen%201%20(2).dart';
import 'package:balti/Screens/Buyer/Accounts/Address.dart';
import 'package:balti/Screens/Buyer/Accounts/orders_screenprocess.dart';
import 'package:balti/Screens/Buyer/Rating.dart';
import 'package:balti/Screens/Buyer/checkout/Checkout.dart';
import 'package:balti/Screens/Constants.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Auth(),
          ),

          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (ctx) => Orders('', '', []),
            update: (ctx, auth, previousOrders) => Orders(
              auth.token!,
              auth.userid,
              previousOrders!.orders,
            ),
          ),
          ChangeNotifierProxyProvider<Auth, BaltiMeals>(
            create: (ctx) => BaltiMeals('', [], ''),
            update: (ctx, auth, previousProducts) => BaltiMeals(
              auth.token!,
              previousProducts == null ? [] : previousProducts.items,
              auth.userid,
            ),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Cart(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Utilities(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Feedbacks(),
          ),
          // ChangeNotifierProvider(
          //   create: (ctx) => Orders(),
          // ),
        ],
        child: Consumer<Auth>(
            builder: (ctx, auth, _) => MaterialApp(
                    title: 'BaltiApp',
                    theme: ThemeData(
                      primaryColor: Color(0xffB788E5),
                      accentColor: Color(0xff8d43d6),
                    ),
                    home: auth.isAuth
                        ? TabsScreen()
                        : FutureBuilder(
                            future: auth.tryAutoLogin(),
                            builder: (ctx, authResultSnapshot) =>
                                authResultSnapshot.connectionState ==
                                        ConnectionState.waiting
                                    ? Splash()
                                    : LoginScreen1(),
                          ),
                    routes: {
                      HomeScreen.route: (ctx) => HomeScreen(),
                      LoginScreen1.routename: (ctx) => LoginScreen1(),
                      TabsScreen.route: (ctx) => TabsScreen(),
                      Mysignuppage.route: (ctx) => Mysignuppage(),
                      ForgotPasswordScreen.route: (ctx) =>
                          ForgotPasswordScreen(),
                      ResetPassword.route: (ctx) => ResetPassword(),
                      VerifyEmail.route: (ctx) => VerifyEmail(),
                      HomeScreen.route: (ctx) => TabsScreen(),
                      Mycart.route: (ctx) => Mycart(),
                      ProductDetailScreen.routeName: (ctx) =>
                          ProductDetailScreen(),
                      CheckoutScreen.route: (ctx) => CheckoutScreen(),
                      Profile.routeName: (ctx) => Profile(),
                      OrderStatus.routeName: (ctx) => OrderStatus(),
                      OrdersScreen.routeName: (ctx) => OrdersScreen(),
                      AboutUs.routeName: (ctx) => AboutUs(),
                      Address.routeName: (ctx) => Address(),
                      Sellerdashboard.routeName: (ctx) => Sellerdashboard(),
                      UserProductsScreen.routeName: (ctx) =>
                          UserProductsScreen(),
                      AddProductScreen.routeName: (ctx) => AddProductScreen(),
                      FeedbackScreen.routename: (ctx) => FeedbackScreen(),
                      ManageFeedbacks.routeName: (ctx) => ManageFeedbacks(),
                      OrdersApprovalScreen.routeName: (ctx) =>
                          OrdersApprovalScreen(),
                      Rating.routename: (ctx) => Rating(),
                      OrdersScreenprocessprocess.routeName: (ctx) =>
                          OrdersScreenprocessprocess()
                    })));
  }
}
