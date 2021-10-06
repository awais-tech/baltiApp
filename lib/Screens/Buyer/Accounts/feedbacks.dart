import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

enum SingingCharacter { comments, bugs, questions }

class FeedbackScreen extends StatefulWidget {
  static final routename = 'feedback';

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  SingingCharacter? _character = SingingCharacter.comments;

  Widget buildFirstName() {
    return Container(
      width: double.infinity,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB788E5), width: 2.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            labelText: 'First Name',
            hintText: 'Enter Your First Name',
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
      ),
    );
  }

  Widget buildLastName() {
    return Container(
      width: double.infinity,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB788E5), width: 2.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            hintText: 'Enter Your Last Name',
            labelText: 'Last Name',
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
      ),
    );
  }

  Widget buildEmail() {
    return Container(
      width: double.infinity,
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (String value) {},
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB788E5), width: 2.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            labelText: 'Email',
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
      ),
    );
  }

  Widget buildDescription() {
    return Container(
      width: double.infinity,
      child: TextField(
        keyboardType: TextInputType.text,
        maxLines: 2,
        decoration: InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffB788E5), width: 2.0),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
      ),
    );
  }

  Widget buildFeedbackType() {
    return Column(
      children: <Widget>[
        RadioListTile(
          activeColor: Color(0xff8d43d6),
          groupValue: _character,
          title: const Text('Comments'),
          value: SingingCharacter.comments,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          secondary: const Icon(
            Icons.comment,
            color: Color(0xff8d43d6),
          ),
        ),
        RadioListTile(
          activeColor: Color(0xff8d43d6),
          groupValue: _character,
          title: const Text('Bug Reports'),
          value: SingingCharacter.bugs,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          secondary: const Icon(
            Icons.bug_report_rounded,
            color: Color(0xff8d43d6),
          ),
        ),
      ],
    );
  }

  Widget buildSubmitBtn() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8 * 3),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'SAVE',
            style: TextStyle(color: Color(0xff8d43d6)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
        backgroundColor: Color(0xffB788E5),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8 * 2, vertical: 8 * 3),
                child: Text(
                  "We would love to hear your thoughts, concerns and problem with anything, so we can improve.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(8 * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Feedback Type",
                          style: TextStyle(
                              color: Color(0xff8d43d6),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      buildFeedbackType(),
                      SizedBox(
                        height: 8 * 3,
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Tell us how you feel about your order'),
                            RatingBar.builder(
                              initialRating: 1,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                switch (index) {
                                  case 0:
                                    return Icon(
                                      Icons.sentiment_very_dissatisfied,
                                      color: Colors.red,
                                    );
                                  case 1:
                                    return Icon(
                                      Icons.sentiment_dissatisfied,
                                      color: Colors.redAccent,
                                    );
                                  case 2:
                                    return Icon(
                                      Icons.sentiment_neutral,
                                      color: Colors.amber,
                                    );
                                  case 3:
                                    return Icon(
                                      Icons.sentiment_satisfied,
                                      color: Colors.lightGreen,
                                    );
                                  case 4:
                                    return Icon(
                                      Icons.sentiment_very_satisfied,
                                      color: Colors.green,
                                    );
                                  default:
                                    return Icon(
                                      Icons.sentiment_neutral,
                                      color: Colors.amber,
                                    );
                                }
                              },
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8 * 3,
                      ),
                      buildFirstName(),
                      SizedBox(
                        height: 8 * 3,
                      ),
                      buildLastName(),
                      SizedBox(
                        height: 8 * 3,
                      ),
                      buildEmail(),
                      SizedBox(
                        height: 8 * 3,
                      ),
                      buildDescription(),
                      SizedBox(
                        height: 8 * 3,
                      ),
                      buildSubmitBtn(),
                      SizedBox(
                        height: 8 * 4,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
