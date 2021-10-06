import 'package:balti/Provider/orders.dart' show Orders;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/Orderhistory';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
          backgroundColor: Color(0xffB788E5),
        ),
        body:
            // FutureBuilder(
            //     future:
            //         Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
            //     builder: (ctx, dataSnapshot) {
            //       if (dataSnapshot.connectionState == ConnectionState.waiting) {
            //         return Center(child: CircularProgressIndicator());
            //       } else {
            //         if (dataSnapshot.error != null) {
            //           // ...
            //           // Do error handling stuff
            //           return Center(
            //             child: Text('An error occurred!'),
            //           );
            //         }

            //         return
            Consumer<Orders>(
          builder: (ctx, orderData, child) => ListView.builder(
            itemCount: orderData.orders.length,
            itemBuilder: (ctx, i) => orderData.orders[i].status == 'complete'
                ? OrderItem(orderData.orders[i])
                : Container(),
          ),
        ));
  }
}
