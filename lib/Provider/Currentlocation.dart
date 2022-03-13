import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart' as geoc;
import 'package:http/http.dart'as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Currentlocation extends ChangeNotifier {
   double lat=0.00;
   double lng=0.00;
  double get latitude => lat;
  double get longitude => lng;
 int getc=0;
  int get count=> getc;
  String finalAddress = "Searching Address";
   var url =
        "https://creativeparkingsolutions.com/android_app/GetactiveorderDays.php";
   currentlocation() async {
     

    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    var postiondate = await GeolocatorPlatform.instance.getCurrentPosition();
    final cord = geoc.Coordinates(postiondate.latitude, postiondate.longitude);
    var address = await geoc.Geocoder.local.findAddressesFromCoordinates(cord);
    String mianaddrerss = address.first.addressLine;
    lat = postiondate.latitude;
    lng = postiondate.longitude;
    finalAddress = mianaddrerss;

    notifyListeners();
  }




 gettotaltime() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();

http.post(Uri.parse(url),body: {
   "userEmail": preferences.getString('Email'),
}).then((value) { 
 var res=jsonDecode(value.body);
 getc=res;
 notifyListeners();
});

    
  }
}
