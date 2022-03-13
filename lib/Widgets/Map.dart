
import 'package:balti/Provider/googlemap.dart';
import 'package:balti/Screens/Seller/AddProduct.dart';
import 'package:balti/Utilities/FormHelper.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart' as geo;
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class Maps extends StatefulWidget {
  static const routeName = '/Googgle-map';
//  late int id;
//  late String name;
//   Maps(name, id) {
//     this.id = id;
//     this.name = name;
//   }

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  var mapstatus = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 10)).then((value) {
      setState(() {
        mapstatus = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
 
       return Scaffold(
        body: mapstatus
            ? Stack(
                children: [
                  Provider.of<GernateMap>(context, listen: false)
                      .fetchmap(context),
                  Center(
                      child: Container(
                          height: 50,
                          margin: EdgeInsets.only(bottom: 40),
                          child: Image.network("https://cdn.shopify.com/s/files/1/1061/1924/products/Red_Pin_Emoji_grande.png?v=1571606035",
                              ))),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Column(
                        children: [
                          // Provider.of<GernateMap>(context, listen: false)
                          //         .getmovemarkers
                          //     ? LinearProgressIndicator(
                          //         valueColor:
                          //             AlwaysStoppedAnimation(Colors.orange),
                          //       )
                          // TextButton.icon(
                          //   icon: Icon(Icons.location_searching),
                          //   label: Provider.of<GernateMap>(context, listen: false)
                          //           .getmovemarker
                          //       ? Text("Locating........")
                          //       : Expanded(
                          //           child: Text(
                          //             Provider.of<GernateMap>(context,
                          //                     listen: false)
                          //                 .getfinaladdess
                          //                 .toString(),
                          //           ),
                          //         ),

                          //   // label: Text("Locating........"),

                          //   onPressed: () {},
                          // ),
                          Provider.of<GernateMap>(context, listen: true)
                                  .getmovemarkers
                              ? LinearProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.orange),
                                )
                              : 
                          Text(
                            Provider.of<GernateMap>(context, listen: true)
                                .getfinaladdess
                                .toString(),style: TextStyle(fontSize:10),
                          ),
                          Text("Latitude And Longitude"),
                          Row(
                            children: [
                              Expanded(child: Text(
                                "Latitude" +
                                    ' ' +
                                    Provider.of<GernateMap>(context, listen: true)
                                        .lat
                                        .toString(),
                              ),),
                             Expanded(child:  Text(
                                "Longitude" +
                                    ' ' +
                                    Provider.of<GernateMap>(context, listen: true)
                                        .lng
                                        .toString(),
                              ),)
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              child: AbsorbPointer(
                                absorbing:
                                    Provider.of<GernateMap>(context, listen: true)
                                            .getmovemarker
                                        ? true
                                        : false,
                                child: FlatButton(
                                    onPressed: () {
                                      FormHelper.showMessage(
                                        context,
                                        "Are you want Save this Location",
                                        "Cancel",
                                        "",
                                        "done",
                                        () {
                                          // final mapprovider = Provider.of<GernateMap>(
                                          //     context,
                                          //     listen: false);
                                          // Provider.of<GernateMap>(context,
                                          //         listen: false)
                                          //     .updatelocation(
                                          //         mapprovider.selectgarage.id,
                                          //         mapprovider.selectgarage.name,
                                          //         context);
                                          // Fluttertoast.showToast(
                                          //     msg: "Saving Location Successfully",
                                          //     toastLength: Toast.LENGTH_SHORT,
                                          //     gravity: ToastGravity.CENTER,
                                          //     timeInSecForIosWeb: 1,
                                          //     backgroundColor: Colors.black,
                                          //     textColor: Colors.white,
                                          //     fontSize: 16.0);
                                          // Navigator.pushReplacement(
                                          //     context,
                                          //     new MaterialPageRoute(
                                          //         builder: (context) => GarageAdmin()));
                                        },
                                        () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                    color: Provider.of<GernateMap>(context,
                                                listen: true)
                                            .getmovemarker
                                        ? Colors.grey
                                        : Colors.orange,
                                    child: Text("Confrim Button")),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pushNamed(AddProductScreen.routeName);
                        
                          }))
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              )),
      );
    
  }
}
