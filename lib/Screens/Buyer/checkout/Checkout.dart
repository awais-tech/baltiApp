import 'package:balti/Provider/cart.dart';
import 'package:balti/Provider/orders.dart';
import 'package:balti/Screens/Buyer/Accounts/orders_screenprocess.dart';
import 'package:balti/Widgets/NewAdress.dart';
import 'package:balti/Widgets/NewCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SingingCharacter { card, cash }

class CheckoutScreen extends StatefulWidget {
  static final route = '/checkout';

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  SingingCharacter? _character = SingingCharacter.cash;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffB788E5),
          title: Text(
            'Checkout',
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                      child: Text(
                        "Payment Methods",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xff8d43d6),
                            fontWeight: FontWeight.bold),
                      )),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    elevation: 5,
                    child: Column(
                      children: [
                        RadioListTile(
                          groupValue: _character,
                          title: const Text('Credit/Debit Card'),
                          value: SingingCharacter.card,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                          secondary: const Icon(Icons.payment),
                        ),
                        RadioListTile(
                          groupValue: _character,
                          title: const Text('Cash'),
                          value: SingingCharacter.cash,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                          secondary: const Icon(Icons.attach_money),
                        ),
                      ],
                    ),
                  ),
                  Button(context, "Add New Card"),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 15),
                            child: Text(
                              "Delivery Address",
                              //textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color(0xff8d43d6),
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                          height: 100,
                          width: double.infinity,
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Home Address",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black87)),
                                  Text(
                                      "House No. 30 Block B PIA Housing Society",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      )),
                                  Text("Johar Town, Lahore 54782",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Button(context, "Add New Address"),
                      ])),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: MediaQuery.of(context).size.width -
                                    MediaQuery.of(context).padding.top) *
                            0.35),
                        backgroundColor: MaterialStateProperty.all(
                            Color(0xff8d43d6)), // <-- Button color
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                          if (states.contains(MaterialState.pressed))
                            return Color(0xffB788E5); // <-- Splash color
                        }),
                      ),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: Text(
                                cart.totalAmount > 0
                                    ? "Proceed"
                                    : "Order will dilver soon",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        (MediaQuery.of(context).size.width -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .top) *
                                            0.05),
                              ),
                            ),
                            new Transform.translate(
                              offset: Offset(15.0, 0.0),
                              child: new Container(
                                // padding: const EdgeInsets.on(1.0),
                                child: TextButton(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    onPressed: cart.totalAmount > 0
                                        ? () => {
                                              showDialog(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title: Text('Are you sure?'),
                                                  content: Text(
                                                    'Do you want to order it?',
                                                  ),
                                                  actions: <Widget>[
                                                    ElevatedButton(
                                                      child: Text('No'),
                                                      onPressed: () {
                                                        Navigator.of(ctx)
                                                            .pop(false);
                                                      },
                                                    ),
                                                    ElevatedButton(
                                                      child: Text('Yes'),
                                                      onPressed: () {
                                                        Provider.of<Orders>(
                                                                context,
                                                                listen: false)
                                                            .addOrder(
                                                          cart.items.values
                                                              .toList(),
                                                          cart.totalAmount,
                                                        );
                                                        cart.clear();
                                                        Navigator.of(ctx)
                                                            .pop(true);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            }
                                        : null),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: cart.totalAmount > 0
                          ? () => {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text('Are you sure?'),
                                    content: Text(
                                      'Do you want to order it?',
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: Text('No'),
                                        onPressed: () {
                                          Navigator.of(ctx).pop(false);
                                        },
                                      ),
                                      ElevatedButton(
                                        child: Text('Yes'),
                                        onPressed: () async {
                                          await Provider.of<Orders>(context,
                                                  listen: false)
                                              .addOrder(
                                            cart.items.values.toList(),
                                            cart.totalAmount,
                                          );
                                          cart.clear();
                                          Navigator.of(ctx).pop(true);
                                          Navigator.of(ctx)
                                              .pushReplacementNamed(
                                                  OrdersScreenprocessprocess
                                                      .routeName);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              }
                          : null,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget Button(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.065,
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        //vertical: 25,
                        horizontal: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).padding.top) *
                    0.2),
                backgroundColor: MaterialStateProperty.all(
                    Color(0xff8d43d6)), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Color(0xffB788E5); // <-- Splash color
                }),
              ),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.add_sharp,
                          color: Colors.white,
                          size: 16,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: (MediaQuery.of(context).size.width -
                                    MediaQuery.of(context).padding.top) *
                                0.04),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () => {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return title == "Add New Card" ? NewCard() : NewAddress();
                    })
              },
            ),
          ),
        ],
      ),
    );
  }
}
