import 'dart:math';

import 'package:balti/Screens/Buyer/Accounts/feedbacks.dart';
import 'package:balti/Utilities/Bottommodaltitle.dart';
import 'package:balti/Utilities/Straightline.dart';
import 'package:balti/Utilities/inputborder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Provider/orders.dart' as ord;

class Orderpending extends StatefulWidget {
  final ord.OrderItem order;

  Orderpending(this.order);

  @override
  _OrderpendingState createState() => _OrderpendingState();
}

class _OrderpendingState extends State<Orderpending> {
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
            title: Row(
              children: [
                Text(' \Rs.${widget.order.amount} '),
              ],
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: Container(
              width: 180,
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.check_outlined),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Are you sure?'),
                            content: Text(
                              'Do you want to Approve the order ?',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.of(ctx).pop(false);
                                  print(2);
                                },
                              ),
                              TextButton(
                                  child: Text('Yes'), onPressed: () async {}),
                            ],
                          ),
                        );
                      },
                      color: Theme.of(context).errorColor,
                    ),
                    IconButton(
                      icon: Icon(Icons.cancel_outlined),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Are you sure?'),
                            content: Text(
                              'Do you want to Disapprove the order ?',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.of(ctx).pop(false);
                                  print(2);
                                },
                              ),
                              TextButton(
                                  child: Text('Yes'), onPressed: () async {}),
                            ],
                          ),
                        );
                      },
                      color: Theme.of(context).errorColor,
                    ),
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
            child: Text('Status Pending',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );
}
