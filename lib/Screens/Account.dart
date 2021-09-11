import 'package:balti/Model/Accountoption.dart';
import 'package:balti/Screens/Orderhistory.dart';
import 'package:balti/Screens/Orderstatus.dart';
import 'package:balti/Screens/Profile.dart';
import 'package:balti/Screens/aboutus.dart';
import 'package:balti/Screens/contactus.dart';
import 'package:balti/Screens/informtion.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<Accountoption> acountinfo = [
    (Accountoption(
      title: 'Orders History',
      icons: Icons.shopping_basket,
      color: Colors.green,
      link: Orderhistory.routeName,
    )),
    (Accountoption(
      title: 'Order Items',
      icons: Icons.wallet_giftcard_outlined,
      color: Colors.green,
      link: OrderStatus.routeName,
    ))
  ];
  List<Accountoption> acounts = [
    (Accountoption(
      title: 'Edit Profile',
      icons: Icons.edit,
      color: Colors.green,
      link: Profile.routeName,
    )),
    (Accountoption(
      title: 'Information',
      icons: Icons.info_outline,
      color: Colors.green,
      link: information.routeName,
    )),
    (Accountoption(
      title: 'Address',
      icons: Icons.phone,
      color: Colors.green,
      link: 'Address',
    )),
    (Accountoption(
      title: 'Contact us',
      icons: Icons.contact_mail,
      color: Colors.green,
      link: ContactUs.routeName,
    )),
    (Accountoption(
      title: 'About us',
      icons: Icons.account_box_outlined,
      color: Colors.green,
      link: AboutUs.routeName,
    )),
    (Accountoption(
      title: 'Sign Out',
      icons: Icons.logout,
      color: Colors.green,
      link: '',
    ))
  ];
  @override
  Widget build(BuildContext context) {
    void changescreen(BuildContext context, String link) {
      Navigator.of(context).pushNamed('$link');
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Column(
            children: [
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Text('Hello!')),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text('Awais Shahbaz',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ],
                  ),
                  height: constraints.maxHeight * 0.16),
              Container(
                height: constraints.maxHeight * 0.83,
                child: ListView(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                                        leading: Icon(x.icons, color: x.color),
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
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                                        leading: Icon(x.icons, color: x.color),
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
            ],
          );
        },
      ),
    );
  }
}
