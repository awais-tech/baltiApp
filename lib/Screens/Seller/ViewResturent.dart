import 'package:balti/Model/Resturent.dart';
import 'package:balti/Screens/Seller/AddProduct.dart';
import 'package:balti/Screens/Seller/AddResturent.dart';
import 'package:balti/Screens/Seller/Manageproducts/Vieproducts.dart';
import 'package:flutter/material.dart';

class ViewResturent extends StatefulWidget {
  Resturent comp;
  static final routeName = 'ViewResturent';

  ViewResturent(this.comp);

  @override
  _ViewResturentState createState() => _ViewResturentState();
}

class _ViewResturentState extends State<ViewResturent> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: FittedBox(
              child: Text(
                'Resturent Name: ${widget.comp.name}',
                softWrap: true,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    color: Colors.red[900],
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          AddProductScreen.routeName,
                          arguments: {"name": widget.comp.name, "id": ""});
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.list_rounded),
                    color: Colors.red[900],
                    onPressed: () {
                      var ids = widget.comp.id;
                      Navigator.of(context).pushNamed(
                          UserProductsScreen.routeName,
                          arguments: widget.comp.name);
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'id: ${widget.comp.id}',
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                // Container(
                //   child: FittedBox(
                //     fit: BoxFit.contain,
                //     child: Text(
                //       'Description: ${widget.comp.description}',
                //       softWrap: true,
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
