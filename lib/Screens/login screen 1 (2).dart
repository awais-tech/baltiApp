import 'package:balti/Screens/HomepageScreen.dart';
import 'package:balti/Screens/signup%20(1).dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class LoginScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "WELCOME TO BALTI",
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
                            height: 10.0,
                            width: 1.0,
                            color: Colors.grey.withOpacity(0.5),
                            margin:
                                const EdgeInsets.only(left: 00.0, right: 10.0),
                          ),
                          new Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                border: InputBorder.none,
                                hintText: 'Enter your Phone Number',
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
                            height: 10.0,
                            width: 1.0,
                            color: Colors.grey.withOpacity(0.5),
                            margin:
                                const EdgeInsets.only(left: 00.0, right: 10.0),
                          ),
                          new Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: InputBorder.none,
                                hintText: 'Enter your Password here',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 10),
                        ),
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
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
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(10)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.pink[900]), // <-- Button color
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.pink[700]; // <-- Splash color
                                }),
                              ),
                              child: new Row(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "Login",
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
                                              .pushReplacementNamed(
                                            HomeScreen.route,
                                          )
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onPressed: () => {
                                Navigator.of(context).pushReplacementNamed(
                                  HomeScreen.route,
                                )
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(child: Text("Don\'t have an account?")),
                              new Container(
                                padding: const EdgeInsets.only(left: 3),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 10),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      Mysignuppage.route,
                                    );
                                  },
                                  child: const Text('Create new account.'),
                                ),
                              ),
                            ],
                          ),
                          new Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "OR",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SignInButton(
                          buttonType: ButtonType.facebook,
                          buttonSize: ButtonSize.small,
                          onPressed: () {}),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SignInButton(
                          buttonType: ButtonType.mail,
                          buttonSize: ButtonSize.small,
                          onPressed: () {}),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SignInButton(
                          buttonType: ButtonType.google,
                          buttonSize: ButtonSize.small,
                          onPressed: () {
                            print('click');
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
