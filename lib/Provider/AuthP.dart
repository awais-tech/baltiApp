import 'dart:async';
import 'dart:convert';

import 'package:balti/Model/Http_exception.dart';
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
    print(222);
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
      // Constants.prefs.setBool('login', true);
      // Constants.prefs.setString('Token', responseData['idToken']);
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(
          seconds: int.parse(
        responseData['expiresIn'],
      )));
      // _autoLogout();
      notifyListeners();
      // final prefs = await SharedPreferences.getInstance();

      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      // await Constants.prefs.setString('userData', userData);
    } catch (e) {
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

  // void logout() {
  //   _token = null;
  //   _userId = '';
  //   _expiryDate = null;
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //     _authTimer = null;
  //   }
  //   notifyListeners();
  //   Constants.prefs.clear();
  // }

  // void _autoLogout() {
  //   if (_authTimer != null) {
  //     _authTimer.cancel();
  //   }
  //   final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
  //   _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  // }
}
