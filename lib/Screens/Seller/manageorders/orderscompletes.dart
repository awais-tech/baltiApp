import 'package:balti/Provider/orders.dart' show Orders;
import 'package:balti/Widgets/order_complete.dart';
import 'package:balti/Widgets/order_pending.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersCompletes extends StatefulWidget {
  static const routeName = '/OrderManage';

  @override
  _OrdersCompletesState createState() => _OrdersCompletesState();
}

class _OrdersCompletesState extends State<OrdersCompletes> {
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
      body: Consumer<Orders>(
        builder: (ctx, orderData, child) => ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx, i) => OrdersComplete(orderData.orders[i]),
        ),
      ),
    );
  }
}