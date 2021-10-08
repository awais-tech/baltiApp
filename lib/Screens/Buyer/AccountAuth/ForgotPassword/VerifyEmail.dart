import 'package:balti/Screens/Buyer/AccountAuth/ForgotPassword/ResetPassword.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  static final route = '/VerifyEmail';
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
                child: Text('Verify Your Email',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8d43d6),
                        fontSize: 24)),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Please enter the 6 digit code sent to your Email',
                    style: TextStyle(fontSize: 12),
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Code',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend Code',
                      ))),
              SizedBox(
                  height: 45,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(ResetPassword.route);
                      },
                      child: Text('Confirm'),
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
