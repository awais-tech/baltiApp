import 'package:balti/Provider/Resturents.dart';
import 'package:balti/Screens/Seller/AddProduct.dart';
import 'package:balti/Screens/Seller/AddResturent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ViewJailCells.dart';
import 'dart:convert';

class ResturentRecords extends StatefulWidget {
  static final routeName = 'JailRecord';

  @override
  State<ResturentRecords> createState() => _ResturentRecordsState();
}

class _ResturentRecordsState extends State<ResturentRecords> {
  var name = "";
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Resturents>(context, listen: false);
    print(3);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: FittedBox(child: Text('Jail Record')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.search),
                ),
                SizedBox(
                  width: 10,
                ), //
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20, right: 10),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onChanged: (val) => setState(() {
                        name = val;
                      }),
                      decoration: InputDecoration(
                        fillColor: Colors.blueAccent[50],
                        filled: true,
                        labelText: 'Search by Prison ID',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black87),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: FutureBuilder(
                  future: Provider.of<Resturents>(context, listen: false)
                      .fetchAndSetResturents(),
                  builder: (context, dataSnapshot) {
                    if (ConnectionState.waiting ==
                        dataSnapshot.connectionState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (dataSnapshot.error != null) {
                      // ...
                      // Do error handling stuff
                      print(dataSnapshot.error);
                      return Center(
                        child: Text('An error occurred!'),
                      );
                    } else if (orderData.resturents.length < 1) {
                      print(orderData.resturents.length);
                      return Center(
                        child: Text('You have no Resturent'),
                      );
                    } else {
                      var resturent = orderData.findowner();
                      // print(resturent[0]);
                      return ListView.builder(
                          itemCount: resturent.length,
                          itemBuilder: (ctx, i) => Container(
                              child: name != ""
                                  ? resturent[i]
                                          .name
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                              name.toString().toLowerCase())
                                      ? Container()
                                      // ? ViewJailCellsRecord(snp.data!.docs[i])
                                      : Container()
                                  : Container()));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add_circle_outline_sharp,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(AddResturent.routeName);
          },
          backgroundColor: Colors.red[900],
        ));
  }
}
