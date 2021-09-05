import 'package:balti/Provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemDetail extends StatefulWidget {
  var productTitle;
  var productPrice;
  var Quantity;
  var keys;
  var id;

  CartItemDetail(
    this.id,
    this.keys,
    this.productPrice,
    this.Quantity,
    this.productTitle,
  );

  @override
  _CartItemDetailState createState() => _CartItemDetailState();
}

class _CartItemDetailState extends State<CartItemDetail> {
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
    var cart = Provider.of<Cart>(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 30,
                width: 30,
                child: GestureDetector(
                    onTap: () {
                      cart.removeSingleItem(widget.keys);
                    },
                    child: Icon(
                      Icons.remove_outlined,
                      color: Colors.grey,
                      size: 30,
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(left: 6, right: 6),
                  child: Text(
                    '${widget.Quantity}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 30,
                width: 30,
                child: GestureDetector(
                    onTap: () {
                      cart.updateSingleItem(widget.keys);
                    },
                    child: Icon(
                      Icons.add_outlined,
                      color: Colors.grey,
                      size: 30,
                    )),
              ),
              Container(
                  height: 30,
                  width: 30,
                  child: IconButton(
                    icon: Icon(Icons.delete_rounded),
                    color: Colors.pink[900],
                    iconSize: 30,
                    onPressed: () {
                      cart.removeItem(widget.keys);
                    },
                  )),
              new Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('${widget.productTitle}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))),
            ],
          ),
          new Padding(
              padding: EdgeInsets.only(left: 30, right: 20),
              child: Text(
                'Rs.${widget.productPrice * widget.Quantity}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ))
        ],
      ),
    );
  }
}
