import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

enum SingingCharacter { comments, bugs, questions }

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  SingingCharacter? _character = SingingCharacter.comments;

  Widget _buildFirstName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          labelText: 'First Name',
          hintText: 'Enter Your First Name',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          hintText: 'Enter Your Last Name',
          labelText: 'Last Name',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (String value) {},
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          labelText: 'Email',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      keyboardType: TextInputType.text,
      maxLines: 2,
      decoration: InputDecoration(
          labelText: 'Description',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildFeedbackType() {
    return Row(
      children: <Widget>[
        RadioListTile(
          groupValue: _character,
          title: const Text('Comments'),
          value: SingingCharacter.comments,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          secondary: const Icon(Icons.attach_money),
        ),
        SizedBox(
          width: 8,
        ),
        RadioListTile(
          groupValue: _character,
          title: const Text('Bug Reports'),
          value: SingingCharacter.bugs,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          secondary: const Icon(Icons.attach_money),
        ),
        SizedBox(
          width: 8,
        ),
        RadioListTile(
          groupValue: _character,
          title: const Text('Questions'),
          value: SingingCharacter.questions,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
          secondary: const Icon(Icons.attach_money),
        ),
      ],
    );
  }

  Widget buildSubmitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8 * 3),
      child: TextButton(
        onPressed: () => null,
        child: Text('SAVE'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Feedback"),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[50],
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8 * 2, vertical: 8 * 3),
              child: Text(
                "We would love to hear your thoughts, concerns and problem with anything, so we can improve.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(8 * 2),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Feedback Type"),
                  _buildFeedbackType(),
                  SizedBox(
                    height: 8 * 3,
                  ),
                  _buildFirstName(),
                  SizedBox(
                    height: 8 * 3,
                  ),
                  _buildLastName(),
                  SizedBox(
                    height: 8 * 3,
                  ),
                  _buildEmail(),
                  SizedBox(
                    height: 8 * 3,
                  ),
                  _buildDescription(),
                  SizedBox(
                    height: 8 * 3,
                  ),
                  SizedBox(
                    height: 8 * 4,
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
