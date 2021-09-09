import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Text(
          'Checkout',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel_outlined,
              size: 32,
              color: Colors.pink[900],
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Payment Methods"),
            Card(
              elevation: 5,
              child: Column(
                children: [
                  CheckboxListTile(
                    title: const Text('Credit/Debit Card'),
                    value: timeDilation != 1.0,
                    onChanged: (bool? value) {
                      setState(() {
                        timeDilation = value! ? 3.0 : 1.0;
                      });
                    },
                    secondary: const Icon(Icons.payment),
                  ),
                  CheckboxListTile(
                    title: const Text('Cash'),
                    value: timeDilation != 1.0,
                    onChanged: (bool? value) {
                      setState(() {
                        timeDilation = value! ? 3.0 : 1.0;
                      });
                    },
                    secondary: const Icon(Icons.attach_money),
                  ),
                ],
              ),
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
                    "+ Add New Card",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: (MediaQuery.of(context).size.width -
                                MediaQuery.of(context).padding.top) *
                            0.04),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () => {},
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Delivery Address"),
                  Card(
                    elevation: 5,
                    child: Text("Billing Address"),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                      vertical: 25,
                                      horizontal: MediaQuery.of(context)
                                              .size
                                              .width -
                                          MediaQuery.of(context).padding.top) *
                                  0.2),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.pink[900]), // <-- Button color
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.red; // <-- Splash color
                          }),
                        ),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "+ Add New Address",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: (MediaQuery.of(context).size.width -
                                        MediaQuery.of(context).padding.top) *
                                    0.04),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPressed: () => {},
                      ))
                ],
              ),
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
                      "Proceed",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: (MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).padding.top) *
                              0.04),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: () => {},
                ))
          ],
        ),
      ),
    );
  }
}
