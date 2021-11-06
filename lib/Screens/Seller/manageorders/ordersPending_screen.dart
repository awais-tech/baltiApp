import 'package:balti/Provider/AuthP.dart';
import 'package:balti/Provider/orders.dart' show Orders;
import 'package:balti/Widgets/order_pending.dart';
import 'package:balti/Widgets/orderprocess.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Orderspendings extends StatefulWidget {
  static const routeName = '/OrderManage';

  @override
  _OrderspendingsState createState() => _OrderspendingsState();
}

class _OrderspendingsState extends State<Orderspendings> {
  var _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      try {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<Orders>(context, listen: false)
            .fetchAndSetOrders(true);
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context, listen: false);
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<Orders>(
              builder: (ctx, orderData, child) => orderData.orders.length > 0
                  ? ListView.builder(
                      itemCount: orderData.orders.length,
                      itemBuilder: (ctx, i) =>
                          orderData.orders[i].status == 'pending' &&
                                  orderData.orders[i].createdby == user.userid
                              ? Orderpending(orderData.orders[i])
                              : Container(),
                    )
                  : Center(child: Text('No order')),
            ),
    );
  }
}
