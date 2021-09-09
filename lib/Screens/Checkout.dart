import 'package:flutter/material.dart';

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
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                    child: Text(
                      "Payment Methods",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.pink[900], fontWeight: FontWeight.bold),
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
                              //vertical: 25,
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
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Transform.translate(
                            offset: Offset(15.0, 0.0),
                            child: new Container(
                              // padding: const EdgeInsets.on(1.0),
                              child: TextButton(
                                  child: Icon(
                                    Icons.add_sharp,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => {}),
                            ),
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Text(
                              "Add New Card",
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
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 15.0),
                                          child: Icon(
                                            Icons.credit_card,
                                            color: Colors.pink[900],
                                          ),
                                        ),
                                        Container(
                                          height: 30.0,
                                          width: 1.0,
                                          color: Colors.grey.withOpacity(0.5),
                                          margin: const EdgeInsets.only(
                                              left: 00.0, right: 10.0),
                                        ),
                                        new Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                              labelText: 'Card Number',
                                              border: InputBorder.none,
                                              hintText: 'Enter 16 digit number',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 15.0),
                                          child: Icon(
                                            Icons.calendar_today_outlined,
                                            color: Colors.pink[900],
                                          ),
                                        ),
                                        Container(
                                          height: 30.0,
                                          width: 1.0,
                                          color: Colors.grey.withOpacity(0.5),
                                          margin: const EdgeInsets.only(
                                              left: 00.0, right: 10.0),
                                        ),
                                        new Expanded(
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.datetime,
                                            decoration: InputDecoration(
                                              labelText: 'Valid Until',
                                              border: InputBorder.none,
                                              hintText: 'DD/MM/YYYY',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 15.0),
                                          child: Icon(
                                            Icons.password,
                                            color: Colors.pink[900],
                                          ),
                                        ),
                                        Container(
                                          height: 30.0,
                                          width: 1.0,
                                          color: Colors.grey.withOpacity(0.5),
                                          margin: const EdgeInsets.only(
                                              left: 00.0, right: 10.0),
                                        ),
                                        new Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Pin',
                                              border: InputBorder.none,
                                              hintText: 'Enter 4 digit pin',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Row(
                                      children: <Widget>[
                                        new Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 15.0),
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.pink[900],
                                          ),
                                        ),
                                        Container(
                                          height: 30.0,
                                          width: 1.0,
                                          color: Colors.grey.withOpacity(0.5),
                                          margin: const EdgeInsets.only(
                                              left: 00.0, right: 10.0),
                                        ),
                                        new Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.name,
                                            decoration: InputDecoration(
                                              labelText: 'Card Holder Name',
                                              border: InputBorder.none,
                                              hintText:
                                                  'Enter exact name as per Card',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 15),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Submit'),
                                  ),
                                ],
                              ),
                            );
                          })
                    },
                  ),
                ),
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
                                color: Colors.pink[900],
                                fontWeight: FontWeight.bold),
                          )),
                      Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        elevation: 5,
                        child: Text("Billing Address"),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          margin: EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                          vertical: 25,
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .top) *
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
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Transform.translate(
                                    offset: Offset(15.0, 0.0),
                                    child: new Container(
                                      // padding: const EdgeInsets.on(1.0),
                                      child: TextButton(
                                          child: Icon(
                                            Icons.add_sharp,
                                            color: Colors.white,
                                          ),
                                          onPressed: () => {}),
                                    ),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: Text(
                                      "Add New Address",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .top) *
                                              0.05),
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
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 20.0),
                                            child: Row(
                                              children: <Widget>[
                                                new Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 15.0),
                                                  child: Icon(
                                                    Icons.map_outlined,
                                                    color: Colors.pink[900],
                                                  ),
                                                ),
                                                Container(
                                                  height: 30.0,
                                                  width: 1.0,
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  margin: const EdgeInsets.only(
                                                      left: 00.0, right: 10.0),
                                                ),
                                                new Expanded(
                                                  child: TextField(
                                                    keyboardType: TextInputType
                                                        .streetAddress,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Enter New Address',
                                                      border: InputBorder.none,
                                                      hintText:
                                                          'Complete Billing Address',
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            onPressed: () {},
                                            child: const Text('Submit'),
                                          ),
                                        ],
                                      ),
                                    );
                                  })
                            },
                          ))
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
                        0.35),
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
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(right: 2.0),
                          child: Text(
                            "Proceed",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: (MediaQuery.of(context).size.width -
                                        MediaQuery.of(context).padding.top) *
                                    0.07),
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
                                onPressed: () => {}),
                          ),
                        ),
                      ],
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
