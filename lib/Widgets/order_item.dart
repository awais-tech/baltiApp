import 'dart:math';

import 'package:balti/Provider/AuthP.dart';
import 'package:balti/Provider/feedback.dart';
import 'package:balti/Screens/Buyer/Accounts/feedbacks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Provider/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    print(widget.order.products);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: FutureBuilder(
          future: Provider.of<Feedbacks>(context, listen: false)
              .fetchAndSetProducts(
                  false, Provider.of<Auth>(context, listen: false).userid),
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Consumer<Feedbacks>(
                      builder: (ctx, feed, child) => feed
                              .result(widget.order.id)
                          ? IconButton(
                              icon: Icon(Icons.feedback_outlined,
                                  color: Color(0xff8d43d6)),
                              onPressed: () => Navigator.of(context).pushNamed(
                                  FeedbackScreen.routename,
                                  arguments: {
                                    'id': widget.order.id,
                                    'create': widget.order.createdby,
                                    'email': widget.order.email
                                  }),
                            )
                          : Icon(Icons.feedback_rounded, color: Colors.green)),
                  title: Row(
                    children: [
                      Text('\Rs.${widget.order.amount} '),
                      Text(' ${widget.order.status}'),
                    ],
                  ),
                  subtitle: Text(
                    DateFormat('dd/MM/yyyy hh:mm')
                        .format(widget.order.dateTime),
                  ),
                  trailing: IconButton(
                    icon:
                        Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  ),
                ),
                if (_expanded)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    height: min(widget.order.products.length * 20.0 + 10, 100),
                    child: ListView(
                      children: widget.order.products
                          .map(
                            (prod) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  prod.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${prod.quantity}x \$${prod.price}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  )
              ],
            );
          }),
    );
  }
}
