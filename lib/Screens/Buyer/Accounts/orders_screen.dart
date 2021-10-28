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
      try {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        _showErrorDialog(e as String);
      }
    });

    super.initState();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(message),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
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
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Consumer<Orders>(
                    builder: (ctx, orderData, child) =>
                        orderData.orders.length > 0
                            ? ListView.builder(
                                itemCount: orderData.orders.length,
                                itemBuilder: (ctx, i) =>
                                    orderData.orders[i].status == 'complete'
                                        ? OrderItem(orderData.orders[i])
                                        : Container(),
                              )
                            : Center(child: Text('No order')),
                  ));
  }
}
