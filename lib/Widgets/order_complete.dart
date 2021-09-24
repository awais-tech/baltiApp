import 'dart:math';

import 'package:balti/Screens/Buyer/Accounts/feedbacks.dart';
import 'package:balti/Utilities/Bottommodaltitle.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Provider/orders.dart' as ord;

class OrdersComplete extends StatefulWidget {
  final ord.OrderItem order;

  OrdersComplete(this.order);

  @override
  _OrdersCompleteState createState() => _OrdersCompleteState();
}

class _OrdersCompleteState extends State<OrdersComplete> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    print(widget.order.products);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.feedback_outlined, color: Colors.pinkAccent),
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(FeedbackScreen.routename),
            ),
            title: Row(
              children: [
                Text(' \Rs.${widget.order.amount} '),
                Text('Status: Complete',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: Container(
              width: 100,
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.details_outlined),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return editEmail(context, "View Detail");
                            });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                          _expanded ? Icons.expand_less : Icons.expand_more),
                      onPressed: () {
                        setState(() {
                          _expanded = !_expanded;
                        });
                      },
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }
}

Widget editEmail(BuildContext context, String title) {
  return Padding(
    padding: MediaQuery.of(context).viewInsets,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Bottommodeltitle(title),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Email:daniyal@gmail.com',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Address:885 C j2 Johar town',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Name:Awais Shahbaz',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Phone no:03054055977',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Status: Complete',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );
}
