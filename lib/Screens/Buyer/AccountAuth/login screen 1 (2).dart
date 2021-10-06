import 'package:balti/Model/Http_exception.dart';
import 'package:balti/Provider/AuthP.dart';
import 'package:balti/Screens/Buyer/HomepageScreen.dart';
import 'package:balti/Screens/Buyer/AccountAuth/signup%20(1).dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/sign_button.dart';

class LoginScreen1 extends StatefulWidget {
  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(message),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    try {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      await Provider.of<Auth>(context, listen: false).login(
        _authData['email'] as String,
        _authData['password'] as String,
      );
      Navigator.of(context).pushNamed(HomeScreen.route);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      print(error);
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
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
                                    fontSize:
                                        (MediaQuery.of(context).size.width -
                                                MediaQuery.of(context)
                                                    .padding
                                                    .top) *
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
                                Padding(
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
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: InputBorder.none,
                                      hintText: 'Enter your Email Address',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return 'Invalid email!';
                                      }
                                    },
                                    onSaved: (value) {
                                      _authData['email'] = value!;
                                    },
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
                                Padding(
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
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 10.0),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: InputBorder.none,
                                      hintText: 'Enter your Password here',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 6) {
                                        return 'Password is too short!';
                                      }
                                    },
                                    onSaved: (value) {
                                      _authData['password'] = value!;
                                    },
                                    obscureText: true,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      )),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                                  vertical: 1,
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          MediaQuery.of(context)
                                                              .padding
                                                              .top) *
                                              0.08),
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors
                                              .pink[900]), // <-- Button color
                                      overlayColor: MaterialStateProperty
                                          .resolveWith<Color?>((states) {
                                        if (states
                                            .contains(MaterialState.pressed))
                                          return Colors
                                              .pink[700]; // <-- Splash color
                                      }),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2.0),
                                            child: Text(
                                              "Login",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: Offset(15.0, 0.0),
                                            child: Container(
                                              // padding: const EdgeInsets.on(1.0),
                                              child: TextButton(
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () => {
                                                  // Navigator.of(context)
                                                  //     .pushReplacementNamed(
                                                  //   HomeScreen.route,
                                                  // )
                                                  _submit()
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    onPressed: () => {_submit()},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 2.0),
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        child: Text("Don\'t have an account?")),
                                    Container(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 10),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                            Mysignuppage.route,
                                          );
                                        },
                                        child:
                                            const Text('Create new account.'),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    "OR",
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            padding: const EdgeInsets.only(left: 20.0),
                            child: SignInButton(
                                buttonType: ButtonType.facebook,
                                buttonSize: ButtonSize.small,
                                onPressed: () {}),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            padding: const EdgeInsets.only(left: 20.0),
                            child: SignInButton(
                                buttonType: ButtonType.mail,
                                buttonSize: ButtonSize.small,
                                onPressed: () {}),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
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
          ],
        ),
      ),
    );
  }
}
