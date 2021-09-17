import 'package:balti/Screens/HomepageScreen.dart';
import 'package:flutter/material.dart';

class Sellerdashboard extends StatelessWidget {
  static const routeName = '/Dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[900],
          title:
              FittedBox(fit: BoxFit.fitWidth, child: Text('Seller Dashboard')),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context).pushReplacementNamed(HomeScreen.route)
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(width: 1, color: Colors.black38)),
                backgroundColor: MaterialStateProperty.all(Colors.pink[900]),
              ),
              child: FittedBox(
                  fit: BoxFit.fitWidth, child: Text('Switch to Consumer')),
            ),
          ],
        ), //AppBar
        body: LayoutBuilder(builder: (ctx, constraints) {
          return Center(
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            tileColor: Colors.blueGrey[50],
                            onTap: () {},
                            title: Text(
                              "Hi, User",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "There are 627 Businesses serving in your area. Be one of them",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(
                              Icons.add_business_outlined,
                              color: Colors.black,
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: constraints.maxHeight * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            color: Colors.pink,
                            elevation: 8,
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.business_center_rounded,
                                    size: 75,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Businesses",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ), //BoxDecoration
                        ), //Container
                      ), //Flexible
                      SizedBox(
                        width: 20,
                      ),
                      //Flexible

                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: constraints.maxHeight * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            elevation: 8,
                            color: Colors.amber[400],
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.poll_rounded,
                                    size: 75,
                                  ),
                                  Text(
                                    "Orders",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ), //BoxDecoration
                          ),
                        ),
                      ), //Container
                    ],
                  ),
                  //Row
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          width: 380,
                          height: constraints.maxHeight * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            elevation: 8,
                            color: Colors.pink[200],
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.sell,
                                    size: 75,
                                  ),
                                  Text(
                                    "Sales",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ), //BoxDecoration
                        ), //Container
                      ),
                    ],
                  ), //Flexible
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Container(
                          width: 180,
                          height: constraints.maxHeight * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            elevation: 8,
                            color: Colors.cyanAccent[400],
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.feedback_rounded,
                                    size: 75,
                                  ),
                                  Text(
                                    "Feedbacks",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ), //BoxDecoration
                        ),
                        //Container
                      ), //Flexible
                      SizedBox(
                        width: 20,
                      ), //SixedBox
                      Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Container(
                            width: 180,
                            height: constraints.maxHeight * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Card(
                              elevation: 8,
                              color: Colors.deepOrange[700],
                              child: InkWell(
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.logout_rounded,
                                      size: 75,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ), //BoxDecoration
                          ) //Container,
                          ) //Flexible
                    ], //<widget>[]
                    mainAxisAlignment: MainAxisAlignment.center,
                  ), //Row
                ], //<Widget>[]
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
              ), //Column
            ) //Padding
                ), //Container
          );
        }) //Center
        ); //Scaffold
  }
}
