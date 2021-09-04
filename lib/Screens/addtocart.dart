import 'package:flutter/material.dart';
import '../Widgets/cart_item_details.dart';

class Mycart extends StatelessWidget {
  static final route = '/Cart';
  final List<String> productTitle = <String>[
    'MilkPak',
    'Nestle',
    'Dalda',
    'Pepsi',
    'Dairy Milk',
    'Dalda',
    'Pepsi',
    'Dairy Milk',
    'Dairy Milk',
    'Dalda',
    'Pepsi',
    'Dairy Milk'
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          size: 32,
                          color: Colors.pink[900],
                        ),
                      ),
                    ),
                    Text(
                      'Balti Cart',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  height: 410,
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
                      // Container(
                      //     margin: EdgeInsets.only(left: 20, right: 20),
                      //     child: Divider(
                      //       thickness: 2,
                      //     )),
                      Container(
                        height: 200,
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: productTitle.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartItemDetail(productTitle[index]);
                          },
                        ),
                      ),
                      // Container(
                      //     margin: EdgeInsets.only(left: 20, right: 20),
                      //     child: Divider(
                      //       thickness: 2,
                      //     )),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //     left: 20,
                      //   ),
                      //   child: CartItemDetail(),
                      // ),
                      // Container(
                      //     margin: EdgeInsets.only(left: 20, right: 20),
                      //     child: Divider(
                      //       thickness: 2,
                      //     )),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Rs.',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Fee',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Rs.',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Rs.',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  backgroundColor: MaterialStateProperty.all(
                      Colors.pink[900]), // <-- Button color
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.red; // <-- Splash color
                  }),
                ),
                child: Text(
                  "Review Address and Payment",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
