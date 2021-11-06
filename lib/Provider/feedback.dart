import 'package:balti/Model/FeedbacksCollection.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Feedbacks with ChangeNotifier {
  List<FeedbacksCollection> _feedback = [];

  List<FeedbacksCollection> get feedback {
    return [..._feedback];
  }

  bool result(String id) {
    return _feedback.every((feed) => feed.oID != id);
  }

  List<FeedbacksCollection> orderfeedback(String id) {
    return _feedback.where((feed) => feed.proid == id).toList();
  }

  double get total {
    return feedback.length > 0
        ? (_feedback.fold(
                0.0,
                (previousValue, element) =>
                    (previousValue as double) + element.rating) /
            _feedback.length)
        : 0;
  }

  Future<void> fetchAndSetProducts([
    bool user = false,
    uid,
    prod = '',
  ]) async {
    var filterByUse = user ? 'true' : '';
    filterByUse = prod == '' ? filterByUse : 'prod';
    var url =
        Uri.parse('https://baltiapi.herokuapp.com/feedback/$uid/$filterByUse');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);

      final List<FeedbacksCollection> loadedProducts = [];

      extractedData != Null || extractedData.length > 0
          ? extractedData.forEach((prodData) {
              loadedProducts.add(FeedbacksCollection(
                  description: prodData['description'],
                  uID: prodData['UID'],
                  oID: prodData['OID'],
                  owner: prodData['owner'],
                  rating: prodData['rating'],
                  email: prodData['email'],
                  proid: prodData['proid']));
            })
          : print(2);

      _feedback = loadedProducts;

      notifyListeners();
      print(_feedback);
    } catch (error) {
      _feedback = [];
      notifyListeners();
      print(error);
      throw (error);
    }
  }

  Future<void> addfeedback(
      {required FeedbacksCollection feedb,
      uID,
      oID,
      created,
      rating,
      email,
      prod}) async {
    try {
      var url = Uri.parse('https://baltiapi.herokuapp.com/feedback');
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = await http.post(
        url,
        headers: headers,
        body: json.encode({
          'UID': uID,
          'OID': oID,
          'description': feedb.description,
          'owner': created,
          'rating': rating,
          'email': email,
          'proid': prod,
        }),
      );
      _feedback.insert(
          0,
          FeedbacksCollection(
              description: feedb.description,
              uID: uID,
              oID: oID,
              owner: created,
              rating: rating,
              email: email,
              proid: prod));
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
