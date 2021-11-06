import 'dart:ui';
import 'package:balti/Model/FeedbacksCollection.dart';
import 'package:balti/Provider/AuthP.dart';
import 'package:balti/Provider/feedback.dart';
import 'package:balti/Screens/Buyer/HomepageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

enum SingingCharacter { comments, bugs }

class FeedbackScreen extends StatefulWidget {
  static final routename = 'feedback';

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  SingingCharacter? _character = SingingCharacter.comments;
  final _feedbackKey = GlobalKey<FormState>();
  final _descriptionFocusNode = FocusNode();
  //final _textControl = TextEditingController();
  bool loading = false;
  var rating;
  //bool init = true;
  var _feedback = FeedbacksCollection(
    description: '',
  );
  var initial = {
    'description': '',
  };
  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void saveform() async {
    var form = _feedbackKey.currentState!.validate();
    if (!form) {
      return;
    }
    try {
      var oid = ModalRoute.of(context)!.settings.arguments as Map;
      _feedbackKey.currentState!.save();
      var id = Provider.of<Auth>(context, listen: false).userid;

      setState(() {
        loading = true;
      });
      await Provider.of<Feedbacks>(context, listen: false).addfeedback(
          feedb: _feedback,
          uID: id,
          oID: oid['id'],
          created: oid['create'],
          rating: rating,
          email: oid['email'],
          prod: oid['productid']);
      Navigator.of(context).pushNamed(HomeScreen.route);
    } catch (e) {
      Navigator.of(context).pushNamed(HomeScreen.route);
      // _showErrorDialog('Something Goes wrong ');
    }
// addfeedback
    setState(() {
      loading = false;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(message),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
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
      body: loading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.green,
              semanticsLabel: 'Please Wait',
            ))
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8 * 2, vertical: 8 * 3),
                      child: Text(
                        "We would love to hear your thoughts, concerns and problem with anything, so we can improve.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(8 * 2),
                        child: Form(
                          key: _feedbackKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 8 * 3,
                              ),
                              Container(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        'Tell us how you feel about your order'),
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
                                      onRatingUpdate: (ratin) {
                                        setState(() {
                                          rating = ratin;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8 * 3,
                              ),
                              Container(
                                width: double.infinity,
                                child: TextFormField(
                                  initialValue:
                                      initial['description'] as String,
                                  maxLines: 3,
                                  keyboardType: TextInputType.multiline,
                                  focusNode: _descriptionFocusNode,
                                  decoration: InputDecoration(
                                      labelText: 'Description',
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffB788E5),
                                            width: 2.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      labelStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a Description.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _feedback = FeedbacksCollection(
                                      description: value!,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 8 * 3,
                              ),
                              Center(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8 * 3),
                                  child: TextButton(
                                    onPressed: saveform,
                                    child: Text(
                                      'SAVE',
                                      style:
                                          TextStyle(color: Color(0xff8d43d6)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8 * 4,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
    );
  }
}
