import 'package:flutter/material.dart';

class CartItemDetail extends StatefulWidget {
  String productTitle;
  CartItemDetail(this.productTitle);

  @override
  _CartItemDetailState createState() => _CartItemDetailState();
}

class _CartItemDetailState extends State<CartItemDetail> {
  final List<int> productPrice = <int>[140, 100, 300, 86, 55];

  int counter = 1;

  void incrementCounter() {
    setState(() {
      if (counter == 99) {
        return null;
      }
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter == 0) {
        return null;
      }
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child: GestureDetector(
                onTap: decrementCounter,
                child: Icon(
                  Icons.remove_circle,
                  color: Colors.white,
                  size: 30,
                )),
          ),
          Container(
              margin: EdgeInsets.only(left: 6, right: 6),
              child: Text(
                '$counter',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child: GestureDetector(
                onTap: incrementCounter,
                child: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 30,
                )),
          ),
          new Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('${widget.productTitle}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))),
        ],
      ),
    );
  }
}
