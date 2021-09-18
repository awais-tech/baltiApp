import 'package:balti/Provider/cart.dart';
import 'package:balti/Screens/Buyer/checkout/Checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/cart_item_details.dart';

class Mycart extends StatefulWidget {
  static final route = '/Cart';
  @override
  _MycartState createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    var screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Text('Balti Cart'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                    height: MediaQuery.of(context).size.height * 0.67,
                    width: screenWidth.width * 1.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0),
                              spreadRadius: 1,
                              blurRadius: 8)
                        ]),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Card(
                            elevation: 5,
                            child: ListTile(
                              leading: Icon(
                                Icons.delivery_dining,
                                color: Colors.pink[900],
                                size: 50,
                              ),
                              title: const Text('Estimated delivery'),
                              subtitle: Text(
                                'NOW(30 Minutes)',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                          ),
                        ),
                        cart.itemCount < 1
                            ? Center(child: Text('Your cart is empty'))
                            : Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  itemCount: cart.items.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return CartItemDetail(
                                      cart.items.values.toList()[i].id,
                                      cart.items.keys.toList()[i],
                                      cart.items.values.toList()[i].price,
                                      cart.items.values.toList()[i].quantity,
                                      cart.items.values.toList()[i].title,
                                    );
                                  },
                                ),
                              ),
                        Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Divider(
                              thickness: 2,
                            )),
                        cart.items.length > 0
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Subtotal',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rs.${cart.totalAmount}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Delivery Fee',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          'Rs.50',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rs.${cart.totalAmount + 50}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 20, left: 20, right: 20),
                                        child: Divider(
                                          thickness: 2,
                                        )),
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            vertical: 25,
                            horizontal: MediaQuery.of(context).size.width -
                                MediaQuery.of(context).padding.top) *
                        0.2),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.pink[900]), // <-- Button color
                    overlayColor:
                        MaterialStateProperty.resolveWith<Color?>((states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.red; // <-- Splash color
                    }),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      cart.items.length > 0
                          ? "Review Address and Payment"
                          : "Add Some Value into Cart",
                      style: TextStyle(
                          color: cart.items.length > 0
                              ? Colors.white
                              : Colors.grey,
                          fontSize: (MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).padding.top) *
                              0.04),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: cart.itemCount < 1
                      ? null
                      : () => {
                            Navigator.of(context).pushNamed(
                              CheckoutScreen.route,
                            )
                          },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
