import 'package:balti/Provider/MealsProvider.dart';
import 'package:balti/Screens/HomepageScreen.dart';
import 'package:balti/Screens/addtocart.dart';
import 'package:balti/Screens/login%20screen%201%20(2).dart';
import 'package:balti/Screens/signup%20(1).dart';
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
      ],
      child: MaterialApp(
          title: 'BaltiApp',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen1(),
          routes: {
            Mysignuppage.route: (ctx) => Mysignuppage(),
            HomeScreen.route: (ctx) => HomeScreen(),
            Mycart.route: (ctx) => Mycart(),
          }),
    );
  }
}
