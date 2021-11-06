import 'dart:convert';

import 'package:balti/Model/Accountoption.dart';
import 'package:balti/Provider/AuthP.dart';
import 'package:balti/Screens/Buyer/AccountAuth/login%20screen%201%20(2).dart';

import 'package:balti/Screens/Buyer/Accounts/Orderstatus.dart';
import 'package:balti/Screens/Buyer/Accounts/Profile.dart';
import 'package:balti/Screens/Buyer/Accounts/aboutus.dart';
import 'package:balti/Screens/Buyer/Accounts/contactus.dart';
import 'package:balti/Screens/Buyer/Accounts/informtion.dart';
import 'package:balti/Screens/Buyer/Accounts/orders_screen.dart';
import 'package:balti/Screens/Buyer/Accounts/orders_screenprocess.dart';
import 'package:balti/Screens/Buyer/HomepageScreen.dart';
import 'package:balti/Screens/Constants.dart';
import 'package:balti/Widgets/tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var user;
  List<Accountoption> acountinfo = [
    (Accountoption(
      title: 'Orders History',
      icons: Icons.shopping_basket,
      color: Color(0xff8d43d6),
      link: OrdersScreen.routeName,
    )),
    (Accountoption(
      title: 'Order Items',
      icons: Icons.wallet_giftcard_outlined,
      color: Color(0xff8d43d6),
      link: OrdersScreenprocessprocess.routeName,
    ))
  ];
  List<Accountoption> acounts = [
    (Accountoption(
      title: 'Edit Profile',
      icons: Icons.edit,
      color: Color(0xff8d43d6),
      link: Profile.routeName,
    )),
    (Accountoption(
      title: 'Information',
      icons: Icons.info_outline,
      color: Color(0xff8d43d6),
      link: information.routeName,
    )),
    (Accountoption(
      title: 'Address',
      icons: Icons.phone,
      color: Color(0xff8d43d6),
      link: 'Address',
    )),
    (Accountoption(
      title: 'Contact us',
      icons: Icons.contact_mail,
      color: Color(0xff8d43d6),
      link: ContactUs.routeName,
    )),
    (Accountoption(
      title: 'About us',
      icons: Icons.account_box_outlined,
      color: Color(0xff8d43d6),
      link: AboutUs.routeName,
    )),
    (Accountoption(
      title: 'Sign Out',
      icons: Icons.logout,
      color: Color(0xff8d43d6),
      link: '',
    ))
  ];

  void changescreen(BuildContext context, String link) {
    if (link == '') {
      Provider.of<Auth>(context, listen: false).logout();
      Navigator.of(context).pushReplacementNamed(LoginScreen1.routename);
    } else {
      Navigator.of(context).pushNamed('$link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 15, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          child: Text('Hello!')),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: FittedBox(
                          child: Text(
                              '${json.decode(Constants.prefs.getString('userinfo') as String)['name']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xffB788E5))),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        Card(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          elevation: 2,
                          child: Container(
                            child: Column(
                              // can add list view here with height
                              children: acountinfo
                                  .map(
                                    (x) => Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            changescreen(context, x.link);
                                          },
                                          child: ListTile(
                                            leading:
                                                Icon(x.icons, color: x.color),
                                            title: Text(x.title),
                                          ),
                                        ),
                                        x.title != 'Order Items'
                                            ? Divider(thickness: 0.4)
                                            : SizedBox(
                                                height: 2,
                                              ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        Card(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 2,
                          child: Container(
                            // height: 370,
                            child: Column(
                              // can add list view here with height
                              // physics: const NeverScrollableScrollPhysics(),
                              children: acounts
                                  .map(
                                    (x) => Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              changescreen(context, x.link),
                                          child: ListTile(
                                            leading:
                                                Icon(x.icons, color: x.color),
                                            title: Text(x.title),
                                          ),
                                        ),
                                        x.title != 'Sign Out'
                                            ? Divider(thickness: 0.3)
                                            : SizedBox(
                                                height: 2,
                                              ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
