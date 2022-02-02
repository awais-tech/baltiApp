import 'dart:async';
import 'dart:convert';

import 'package:balti/Model/Http_exception.dart';
import 'package:balti/Screens/Constants.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
// import 'package:shopapp/models/Http_exception.dart';
// import 'package:shopapp/utilty/Constants.dart';

class Auth with ChangeNotifier {
  var _token;
  var _expiryDate;
  String _userId = '';
  var _authTimer;

  bool get isAuth {
    return _token != null;
  }

  String get userid {
    return _userId;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return '';
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    try {
      final url = Uri.parse(
          'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyCr4Sog0u_N1K-RtJfJp9nAxfL0hNwlpXA');
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(
          seconds: int.parse(
        responseData['expiresIn'],
      )));

      // _autoLogout();
      notifyListeners();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      await Constants.prefs.setString('userData', userData);

      // get data from mongoose
      if (urlSegment == 'verifyPassword') {
        final url = Uri.parse('https://baltiapi.herokuapp.com/users/$_userId');
        final response = await http.get(url);

        final responses = json.decode(response.body);

        final userinfo = json.encode(
          {
            'name': responses['name'],
            'Password': responses['Password'],
            'email': responses['email'],
            'Phoneno': responses['Phoneno'],
          },
        );
        await Constants.prefs.setString('userinfo', userinfo);
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  // Future<bool> tryAutoLogin() async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   if (!Constants.prefs.containsKey('userData')) {
  //     return false;
  //   }
  //   final extractedUserData =
  //       await json.decode(Constants.prefs.getString('userData') as String);

  //   final expiryDate =
  //       DateTime.parse(extractedUserData['expiryDate'] as String);

  //   if (expiryDate.isBefore(DateTime.now())) {
  //     return false;
  //   }
  //   _token = extractedUserData['token'];
  //   _userId = extractedUserData['userId'] as String;
  //   _expiryDate = expiryDate;
  //   notifyListeners();
  //   _autoLogout();
  //   return true;
  // }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signupNewUser');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'verifyPassword');
  }

  Future<void> ChangePassword(String email) async {
    try {
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyCr4Sog0u_N1K-RtJfJp9nAxfL0hNwlpXA');
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'requestType': 'PASSWORD_RESET',
          },
        ),
      );
      final responseData = json.decode(response.body);
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<void> Changepass(String password) async {
    try {
      final extractedUserData =
          await json.decode(Constants.prefs.getString('userData') as String);
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyCr4Sog0u_N1K-RtJfJp9nAxfL0hNwlpXA');
      final response = await http.post(
        url,
        body: json.encode(
          {
            'idToken': extractedUserData['token'],
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<void> userdetails(String email, String Phoneno, String username,
      String Password, Address) async {
    try {
      final extractedUserData =
          await json.decode(Constants.prefs.getString('userData') as String);
      Map<String, String> headers = {"Content-type": "application/json"};
      var userid = extractedUserData['userId'] as String;
      final url = Uri.parse('https://baltiapi.herokuapp.com/users');
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            'email': email,
            'name': username,
            'Uid': userid,
            'Phoneno': Phoneno,
            'Password': Password,
            "Address": Address
          },
        ),
      );

      final responseData = json.decode(response.body);
      print(response);
      final userinfo = json.encode(
        {
          'email': responseData['email'],
          'Phoneno': responseData['Phoneno'],
          'name': responseData['name'],
          'Password': responseData['Password'],
          "Address": responseData['Address'],
        },
      );
      await Constants.prefs.setString('userinfo', userinfo);

      // // Constants.prefs.setString('Token', responseData['idToken']);
      // _token = responseData['idToken'];
      // _userId = responseData['localId'];
      // _expiryDate = DateTime.now().add(Duration(
      //     seconds: int.parse(
      //   responseData['expiresIn'],
      // )));

      // _autoLogout();
      notifyListeners();

      // final prefs = await SharedPreferences.getInstance();

    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<void> update(info, name) async {
    try {
      var data;
      final extractedUserData =
          await json.decode(Constants.prefs.getString('userData') as String);
      Map<String, String> headers = {"Content-type": "application/json"};
      var userid = extractedUserData['userId'] as String;
      final url = Uri.parse('https://baltiapi.herokuapp.com/users/$userid');
      if (name == 'Password') {
        data = 'Password';
        Changepass(info);
      } else if (name == 'address') {
        data = 'address';
      } else if (name == 'name') {
        data = 'name';
      } else {
        data = 'Address';
      }
      final response = await http.put(
        url,
        headers: headers,
        body: json.encode(
          {
            data: info,
          },
        ),
      );

      final responseData = json.decode(response.body);
      print(response);
      final userinfo = json.encode(
        {
          'email': extractedUserData['email'],
          'Phoneno': responseData['Phoneno'],
          'Address': responseData['Address'],
          'name': responseData['name'],
          'Password': responseData['Password'],
        },
      );
      await Constants.prefs.setString('userinfo', userinfo);

      notifyListeners();
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  // Future<void> addProduct(product) async {
  //   try {
  //     final url = Uri.parse('https://baltiapi.herokuapp.com/products');
  //     Map<String, String> headers = {"Content-type": "application/json"};
  //     print(url);
  //     var doc = await http.post(
  //       url,
  //       headers: headers,
  //       body: json.encode({
  //         'title': product.title,
  //         'description': product.description,
  //         'price': product.price,
  //         'imageUrl': product.imageUrl,
  //         'favourite': product.isFavorite,
  //         'ResturentName': product.ResturentName,
  //         'Category': product.Category,
  //         'Dilvery': product.Dilvery,
  //         'duration': product.duration,
  //         'createdby': userid,
  //       }),
  //     );

  //     final newProduct = Meal(
  //       id: json.decode(doc.body)['_id'],
  //       title: product.title,
  //       description: product.description,
  //       price: product.price,
  //       imageUrl: product.imageUrl,
  //       ResturentName: product.ResturentName,
  //       Category: product.Category,
  //       Dilvery: product.Dilvery,
  //       duration: product.duration,
  //     );
  //     meals.add(newProduct);
  //     notifyListeners();
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  void logout() {
    _token = null;
    _userId = '';
    _expiryDate = null;
    notifyListeners();
    Constants.prefs.clear();
  }

  // void _autoLogout() {
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //   }
  //   final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
  //   _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  // }
  Future<bool> tryAutoLogin() async {
    // final prefs = await SharedPreferences.getInstance();
    if (!Constants.prefs.containsKey('userData')) {
      print(!Constants.prefs.containsKey('userData'));
      return false;
    }

    final extractedUserData =
        await json.decode(Constants.prefs.getString('userData') as String);

    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'] as String;

    notifyListeners();

    return true;
  }
}
