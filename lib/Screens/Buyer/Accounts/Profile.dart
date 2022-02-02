import 'dart:convert';

import 'package:balti/Provider/AuthP.dart';
import 'package:balti/Utilities/Bottommodaltitle.dart';
import 'package:balti/Utilities/Straightline.dart';
import 'package:balti/Utilities/inputborder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants.dart';
// import 'package:progress_state_button/iconed_button.dart';
// import 'package:progress_state_button/progress_button.dart';

class Profile extends StatefulWidget {
  static const routeName = '/Profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final myList = ['Name', 'Address', 'Password'];

  final email = TextEditingController();
  var hide = false;
  final password = TextEditingController();
  final name = TextEditingController();
  final Address = TextEditingController();
  void submit(value, name) async {
    await Provider.of<Auth>(context, listen: false).update(value, name);
    Navigator.of(context).pop();
    setState(() {});
  }
  // Widget progessButton() {
  //   return Container();
  //   // return ProgressButton.icon(iconedButtons: {
  //   //   ButtonState.idle: IconedButton(
  //   //       text: "Save Changes",
  //   //       icon: Icon(Icons.save_alt_rounded, color: Colors.white),
  //   //       color: Colors.pink.shade900),
  //   //   ButtonState.loading:
  //   //       IconedButton(text: "Loading", color: Colors.pink.shade900),
  //   //   ButtonState.fail: IconedButton(
  //   //       text: "Failed",
  //   //       icon: Icon(Icons.cancel, color: Colors.white),
  //   //       color: Colors.red.shade300),
  //   //   ButtonState.success: IconedButton(
  //   //       text: "Success",
  //   //       icon: Icon(
  //   //         Icons.check_circle,
  //   //         color: Colors.white,
  //   //       ),
  //   //       color: Colors.green.shade400)
  //   // }, onPressed: () {});
  // }

  Widget editName(BuildContext context, String title) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Bottommodeltitle(title),
          Divider(
            thickness: 2,
          ),
          Container(
            decoration: putborder(),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.person_add_alt,
                    color: Color(0xff8d43d6),
                  ),
                ),
                Straightline(),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    controller: name,
                    decoration: InputDecoration(
                      labelText: 'Edit  Name',
                      border: InputBorder.none,
                      hintText: 'Please start from uppercase letter',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
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
                    Color(0xff8d43d6)), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Color(0xffB788E5); // <-- Splash color
                }),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => {
                submit(
                  name.text,
                  "name",
                )
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget editEmail(BuildContext context, String title) {
  //   return Padding(
  //     padding: MediaQuery.of(context).viewInsets,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Bottommodeltitle(title),
  //         Divider(
  //           thickness: 2,
  //         ),
  //         Container(
  //           decoration: putborder(),
  //           margin:
  //               const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  //           child: Row(
  //             children: <Widget>[
  //               new Padding(
  //                 padding:
  //                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  //                 child: Icon(
  //                   Icons.email_outlined,
  //                   color: Color(0xff8d43d6),
  //                 ),
  //               ),
  //               Straightline(),
  //               Expanded(
  //                 child: TextField(
  //                   keyboardType: TextInputType.streetAddress,
  //                   controller: email,
  //                   decoration: InputDecoration(
  //                     labelText: 'Edit address',
  //                     border: InputBorder.none,
  //                     hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(bottom: 8.0),
  //           child: ElevatedButton(
  //             style: ButtonStyle(
  //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                   RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10.0),
  //               )),
  //               padding: MaterialStateProperty.all(EdgeInsets.symmetric(
  //                       vertical: 25,
  //                       horizontal: MediaQuery.of(context).size.width -
  //                           MediaQuery.of(context).padding.top) *
  //                   0.35),
  //               backgroundColor: MaterialStateProperty.all(
  //                   Color(0xff8d43d6)), // <-- Button color
  //               overlayColor:
  //                   MaterialStateProperty.resolveWith<Color?>((states) {
  //                 if (states.contains(MaterialState.pressed))
  //                   return Color(0xffB788E5); // <-- Splash color
  //               }),
  //             ),
  //             child: const Text(
  //               "submit",
  //               style: TextStyle(color: Colors.white),
  //             ),
  //             onPressed: () => {
  //               submit(
  //                 email.text,
  //                 "address",
  //               )
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget editPhone(BuildContext context, String title) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Bottommodeltitle(title),
          Divider(
            thickness: 2,
          ),
          Container(
            decoration: putborder(),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.add_call,
                    color: Color(0xff8d43d6),
                  ),
                ),
                Straightline(),
                Expanded(
                  child: TextField(
                    controller: Address,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Edit Address',
                      border: InputBorder.none,
                      hintText: 'Please enter Address with area ',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
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
                    Color(0xff8d43d6)), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Color(0xffB788E5); // <-- Splash color
                }),
              ),
              child: const Text(
                "submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => {
                if (Address.text.length < 7)
                  {
                    Navigator.of(context).pop(),
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Address must be 7 character long',
                      ),
                      duration: Duration(seconds: 2),
                    )),
                  }
                else
                  {
                    submit(
                      Address.text,
                      "Address",
                    )
                  }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget editPassword(BuildContext context, String title) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Bottommodeltitle(title),
          Divider(
            thickness: 2,
          ),
          Container(
            decoration: putborder(),
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
                Straightline(),
                Expanded(
                  child: TextField(
                    controller: password,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Enter New Password',
                      border: InputBorder.none,
                      hintText: 'Please atleast 8 characters',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    obscureText: true,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
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
                    Color(0xff8d43d6)), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Color(0xffB788E5); // <-- Splash color
                }),
              ),
              child: const Text(
                "submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => {
                if (password.text.length < 8)
                  {
                    Navigator.of(context).pop(),
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Password must be 8 character long',
                      ),
                      duration: Duration(seconds: 2),
                    )),
                  }
                else
                  {
                    submit(
                      password.text,
                      "Password",
                    )
                  }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final myListData = [
      json.decode(Constants.prefs.getString('userinfo') as String)['name'],
      // json.decode(Constants.prefs.getString('userinfo') as String)['address'],
      json.decode(Constants.prefs.getString('userinfo') as String)['Address'],
      json.decode(Constants.prefs.getString('userinfo') as String)['Password'],
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB788E5),
        title: Text(
          'Profile',
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              elevation: 5,
              child: ListTile(
                onTap: () {},
                title: Text(
                  "${myList[index]}",
                  style: TextStyle(fontSize: 15),
                ),
                subtitle: Text(
                  "${myListData[index]}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  color: Color(0xff8d43d6),
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          if (index == 0)
                            return editName(context, "Edit Name");
                          // else if (index == 1)
                          //   return editEmail(context, "Edit Email");

                          else if (index == 1) {
                            return editPhone(context, "Edit Address");
                          } else
                            return editPassword(context, "Change Password");
                        });
                  },
                ),
              ),
            );
          }),
    );
  }
}
