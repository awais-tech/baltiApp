import 'package:balti/Utilities/Bottommodaltitle.dart';
import 'package:balti/Utilities/Straightline.dart';
import 'package:balti/Utilities/inputborder.dart';
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
  Widget editName(BuildContext context, String title) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Bottommodeltitle(title),
          Container(
            decoration: putborder(),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.person_add,
                    color: Colors.pink[900],
                  ),
                ),
                Straightline(),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Edit First Name',
                      border: InputBorder.none,
                      hintText: 'Please start from uppercase letter',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: putborder(),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.person_add,
                    color: Colors.pink[900],
                  ),
                ),
                Straightline(),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Edit Last Name',
                      border: InputBorder.none,
                      hintText: 'Please start from uppercase letter',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget editEmail(BuildContext context, String title) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Bottommodeltitle(title),
          Container(
            decoration: putborder(),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.pink[900],
                  ),
                ),
                Straightline(),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Edit Email',
                      border: InputBorder.none,
                      hintText: 'Please follow the Email format',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget editPhone(BuildContext context, String title) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Bottommodeltitle(title),
          Container(
            decoration: putborder(),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.add_call,
                    color: Colors.pink[900],
                  ),
                ),
                Straightline(),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Edit Phone Number',
                      border: InputBorder.none,
                      hintText: 'Please enter phone with area code',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget editPassword(BuildContext context, String title) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Bottommodeltitle(title),
          Container(
            decoration: putborder(),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.password,
                    color: Colors.pink[900],
                  ),
                ),
                Straightline(),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Enter Current Password',
                      border: InputBorder.none,
                      hintText: 'Enter atleast 8 characters',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    obscureText: true,
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: putborder(),
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Icon(
                    Icons.map_outlined,
                    color: Colors.pink[900],
                  ),
                ),
                Straightline(),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      labelText: 'Enter New Password',
                      border: InputBorder.none,
                      hintText: 'Please atleast 8 characters',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    obscureText: true,
                  ),
                )
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

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
                onTap: () {},
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
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          if (index == 0)
                            return editName(context, "Enter New Name");
                          else if (index == 1)
                            return editEmail(context, "Enter new Email");
                          else if (index == 2)
                            return editPhone(context, "Enter new Phone no");
                          else
                            return editPassword(context, "Change Password");
                        });
                  },
                ),
              ),
            );
          }),
    );
  }
}
