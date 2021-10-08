import 'package:balti/Screens/Buyer/AccountAuth/ForgotPassword/VerifyEmail.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static final route = '/ForgotPasswordScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('Forgot Password?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8d43d6),
                        fontSize: 24)),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Enter the Email address associated with your account',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                  height: 45,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(VerifyEmail.route);
                      },
                      child: Text('Verify Email'),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor: MaterialStateProperty.all(
                              Color(0xff8d43d6)), // <-- Button color
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (states) {
                            if (states.contains(MaterialState.pressed))
                              return Color(0xffB788E5);
                          }))))
            ],
          )),
    );
  }
}
