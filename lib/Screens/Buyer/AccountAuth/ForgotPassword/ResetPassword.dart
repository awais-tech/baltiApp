import 'package:balti/Screens/Buyer/AccountAuth/ForgotPassword/VerifyEmail.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  static final route = '/ResetPassword';
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
                child: Text('Reset Password',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff8d43d6),
                        fontSize: 24)),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'New Password',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Confirm New Password',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              SizedBox(
                  height: 45,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(VerifyEmail.route);
                      },
                      child: Text('Reset Password'),
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
