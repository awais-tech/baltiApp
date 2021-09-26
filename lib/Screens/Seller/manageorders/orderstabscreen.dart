import 'package:balti/Screens/Buyer/Accounts/Profile.dart';
import 'package:balti/Screens/Buyer/Accounts/orders_screen.dart';
import 'package:balti/Screens/Seller/manageorders/Ordersinprocess.dart';
import 'package:balti/Screens/Seller/manageorders/ordersPending_screen.dart';
import 'package:balti/Screens/Seller/manageorders/orderscompletes.dart';
import 'package:flutter/material.dart';

class OrdersApprovalScreen extends StatelessWidget {
  static final routeName = 'orderapprove';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[900],
          title: Text('Orders'),
          bottom: TabBar(
            tabs: [
              FittedBox(
                fit: BoxFit.contain,
                child: Tab(
                    icon: Icon(Icons.approval_rounded),
                    text: "Order need approval"),
              ),
              FittedBox(
                child: Tab(
                    icon: Icon(Icons.pending_actions_rounded),
                    text: "Order in processing"),
              ),
              FittedBox(
                  child: Tab(
                      icon: Icon(Icons.done_all_rounded),
                      text: "Complete Orders"))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Orderspendings(),
            OrdersInProcess(),
            OrdersCompletes(),
          ],
        ),
      ),
    );
  }
}