import 'package:balti/Screens/HomepageScreen.dart';
import 'package:flutter/material.dart';

class Mysignuppage extends StatelessWidget {
  static final route = '/SignUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "BALTI SIGN-UP",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: (MediaQuery.of(context).size.width -
                                    MediaQuery.of(context).padding.top) *
                                0.060,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink[900]),
                        textAlign: TextAlign.center,
                      ),
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
                            Icons.person_outline,
                            color: Colors.pink[900],
                          ),
                        ),
                        Container(
                          height: 30.0,
                          width: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                          margin:
                              const EdgeInsets.only(left: 00.0, right: 10.0),
                        ),
                        new Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Enter New Username',
                              border: InputBorder.none,
                              hintText: 'Username must be unique',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10),
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
                            Icons.email,
                            color: Colors.pink[900],
                          ),
                        ),
                        Container(
                          height: 30.0,
                          width: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                          margin:
                              const EdgeInsets.only(left: 00.0, right: 10.0),
                        ),
                        new Expanded(
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Enter New Email',
                              border: InputBorder.none,
                              hintText: 'Please follow the Email format',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10),
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
                            Icons.phone,
                            color: Colors.pink[900],
                          ),
                        ),
                        Container(
                          height: 30.0,
                          width: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                          margin:
                              const EdgeInsets.only(left: 00.0, right: 10.0),
                        ),
                        new Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Enter New Phone Number',
                              border: InputBorder.none,
                              hintText: 'Phone Number with area code',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10),
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
                            Icons.lock_open,
                            color: Colors.pink[900],
                          ),
                        ),
                        Container(
                          height: 30.0,
                          width: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                          margin:
                              const EdgeInsets.only(left: 00.0, right: 10.0),
                        ),
                        new Expanded(
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: 'Enter New Password',
                              border: InputBorder.none,
                              hintText: 'Password must be atleast 6 digits',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(10)),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.pink[900]), // <-- Button color
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.red; // <-- Splash color
                              }),
                            ),
                            child: new Row(
                              children: <Widget>[
                                new Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                new Transform.translate(
                                  offset: Offset(15.0, 0.0),
                                  child: new Container(
                                    padding: const EdgeInsets.all(5.0),
                                    child: TextButton(
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => {
                                        Navigator.of(context)
                                            .pushNamed(HomeScreen.route)
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            onPressed: () => {
                              Navigator.of(context).pushNamed(HomeScreen.route)
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
