import 'package:balti/Utilities/Bottommodaltitle.dart';
import 'package:balti/Utilities/Straightline.dart';
import 'package:balti/Utilities/inputborder.dart';
import 'package:flutter/material.dart';
// import 'package:progress_state_button/iconed_button.dart';
// import 'package:progress_state_button/progress_button.dart';

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
  Widget progessButton() {
    return Container();
    // return ProgressButton.icon(iconedButtons: {
    //   ButtonState.idle: IconedButton(
    //       text: "Save Changes",
    //       icon: Icon(Icons.save_alt_rounded, color: Colors.white),
    //       color: Colors.pink.shade900),
    //   ButtonState.loading:
    //       IconedButton(text: "Loading", color: Colors.pink.shade900),
    //   ButtonState.fail: IconedButton(
    //       text: "Failed",
    //       icon: Icon(Icons.cancel, color: Colors.white),
    //       color: Colors.red.shade300),
    //   ButtonState.success: IconedButton(
    //       text: "Success",
    //       icon: Icon(
    //         Icons.check_circle,
    //         color: Colors.white,
    //       ),
    //       color: Colors.green.shade400)
    // }, onPressed: () {});
  }

  Widget editName(BuildContext context, String title) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Bottommodeltitle(title),
          Divider(
            thickness: 2,
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
                    Icons.person_add_alt,
                    color: Color(0xff8d43d6),
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
                    Icons.person_add_alt,
                    color: Color(0xff8d43d6),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: progessButton(),
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
          Divider(
            thickness: 2,
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
                    Icons.email_outlined,
                    color: Color(0xff8d43d6),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: progessButton(),
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
          Divider(
            thickness: 2,
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
                    Icons.add_call,
                    color: Color(0xff8d43d6),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: progessButton(),
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
          Divider(
            thickness: 2,
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
                    Icons.password,
                    color: Color(0xff8d43d6),
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
                    color: Color(0xff8d43d6),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: progessButton(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB788E5),
        title: Text(
          'Profile',
          textAlign: TextAlign.center,
        ),
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
                  color: Color(0xff8d43d6),
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          if (index == 0)
                            return editName(context, "Edit Name");
                          else if (index == 1)
                            return editEmail(context, "Edit Email");
                          else if (index == 2)
                            return editPhone(context, "Edit Phone");
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
