import 'dart:ui';
import 'package:balti/Model/FeedbacksCollection.dart';
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
  final _feedbackKey = GlobalKey<FormState>();
  final _descriptionFocusNode = FocusNode();
  //final _textControl = TextEditingController();
  bool loading = false;
  //bool init = true;
  var _Feedback = FeedbacksCollection(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    description: '',
    rating: 0,
  );
  var initial = {
    'id': '',
    'firstName': '',
    'lastName': '',
    'email': '',
    'description': '',
    'rating': 0,
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

    _feedbackKey.currentState!.save();
    setState(() {
      loading = true;
    });

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
                                Column(
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
                                ),
                                SizedBox(
                                  height: 8 * 3,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                Icons
                                                    .sentiment_very_dissatisfied,
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
                                Container(
                                    width: double.infinity,
                                    child: TextFormField(
                                      initialValue:
                                          initial['firstName'] as String,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffB788E5),
                                                width: 2.0),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 8),
                                          labelText: 'First Name',
                                          hintText: 'Enter Your First Name',
                                          labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black87)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter a First Name.';
                                        }

                                        return null;
                                      },
                                      onSaved: (value) {
                                        _Feedback = FeedbacksCollection(
                                          id: _Feedback.id,
                                          firstName: value!,
                                          lastName: _Feedback.lastName,
                                          email: _Feedback.email,
                                          description: _Feedback.description,
                                          rating: _Feedback.rating,
                                          isComment: _Feedback.isComment,
                                        );
                                      },
                                    )),
                                SizedBox(
                                  height: 8 * 3,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    initialValue: initial['lastName'] as String,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB788E5),
                                              width: 2.0),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        hintText: 'Enter Your Last Name',
                                        labelText: 'Last Name',
                                        labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black87)),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a Last Name.';
                                      }

                                      return null;
                                    },
                                    onSaved: (value) {
                                      _Feedback = FeedbacksCollection(
                                        id: _Feedback.id,
                                        firstName: _Feedback.firstName,
                                        lastName: value!,
                                        email: _Feedback.email,
                                        description: _Feedback.description,
                                        rating: _Feedback.rating,
                                        isComment: _Feedback.isComment,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * 3,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    initialValue: initial['email'] as String,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    onChanged: (String value) {},
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffB788E5),
                                              width: 2.0),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black87)),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter a Email.';
                                      }
                                      if (!value.contains('@')) {
                                        return 'Please enter a valid Email.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _Feedback = FeedbacksCollection(
                                        id: _Feedback.id,
                                        firstName: _Feedback.firstName,
                                        lastName: _Feedback.email,
                                        email: value!,
                                        description: _Feedback.description,
                                        rating: _Feedback.rating,
                                        isComment: _Feedback.isComment,
                                      );
                                    },
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
                                      _Feedback = FeedbacksCollection(
                                        id: _Feedback.id,
                                        firstName: _Feedback.firstName,
                                        lastName: _Feedback.lastName,
                                        email: _Feedback.email,
                                        description: value!,
                                        rating: _Feedback.rating,
                                        isComment: _Feedback.isComment,
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
}
