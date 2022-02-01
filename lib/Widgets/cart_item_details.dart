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
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  height: 30,
                  width: 30,
                  child: GestureDetector(
                      onTap: () {
                        cart.removeSingleItem(widget.keys);
                      },
                      child: Icon(
                        Icons.remove_outlined,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width * 0.06,
                      )),
                ),
              ),
              FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                      margin: EdgeInsets.only(left: 3, right: 3),
                      child: Text(
                        '${widget.Quantity}',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      ))),
              FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                        onTap: () {
                          cart.updateSingleItem(widget.keys);
                        },
                        child: Icon(
                          Icons.add_outlined,
                          color: Colors.grey,
                          size: MediaQuery.of(context).size.width * 0.06,
                        )),
                  )),
              FittedBox(
                  child: Container(
                      height: 30,
                      width: 30,
                      child: IconButton(
                        icon: Icon(Icons.delete_rounded),
                        color: Colors.red[900],
                        iconSize: MediaQuery.of(context).size.width * 0.04,
                        onPressed: () {
                          cart.removeItem(widget.keys);
                        },
                      ))),
              FittedBox(
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('${widget.productTitle}',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold,
                          )))),
            ],
          ),
          FittedBox(
              fit: BoxFit.cover,
              child: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    'Rs.${widget.productPrice * widget.Quantity}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                    textAlign: TextAlign.right,
                  )))
        ],
      ),
    );
  }
}
