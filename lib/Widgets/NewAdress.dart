import 'package:balti/Provider/AuthP.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewAddress extends StatefulWidget {
  const NewAddress({
    Key? key,
  }) : super(key: key);

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  var address = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.map_outlined,
                    color: Color(0xff8d43d6),
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                ),
                new Expanded(
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    controller: address,
                    decoration: InputDecoration(
                      labelText: 'Enter New Address',
                      border: InputBorder.none,
                      hintText: 'Complete Billing Address',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
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
            onPressed: () async {
              await Provider.of<Auth>(context, listen: false)
                  .updates(address.text, "Address");
              Navigator.of(context).pop();
              setState(() {});
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
