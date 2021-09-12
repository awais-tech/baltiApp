import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/orders.dart' show Orders;
import '../Widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/Orderhistory';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        backgroundColor: Colors.pink[900],
      ),
      body: orderData.orders.length > 0
          ? ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
            )
          : Center(child: Text('You did not order any item yet!')),
    );
  }
}
