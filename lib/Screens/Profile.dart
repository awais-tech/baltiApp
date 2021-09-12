import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const routeName = '/Profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final myList = ['Name', 'Email', 'Phone', 'Password'];
  final myListData = [
    'Daniyal Ayyaz',
    'daniyalayyaz@gmail.com',
    '03336557811',
    '***********'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Text(
          'Profile',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel_outlined,
              size: 32,
              color: Colors.pink[900],
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              elevation: 5,
              child: ListTile(
                title: Text(
                  "${myList[index]}",
                  style: TextStyle(fontSize: 15),
                ),
                subtitle: Text(
                  "${myListData[index]}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.pink[900],
                  onPressed: () {},
                ),
              ),
            );
          }),
    );
  }
}
