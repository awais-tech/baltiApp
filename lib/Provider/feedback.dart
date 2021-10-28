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

  Future<void> fetchAndSetProducts([bool user = false, uid]) async {
    var filterByUse = user ? 'true' : '';
    var url =
        Uri.parse('https://baltiapi.herokuapp.com/feedback/$uid/$filterByUse');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);

      final List<FeedbacksCollection> loadedProducts = [];
      print(extractedData.length);
      extractedData != Null
          ? extractedData.forEach((prodData) {
              loadedProducts.add(FeedbacksCollection(
                  description: prodData['description'],
                  uID: prodData['UID'],
                  oID: prodData['OID'],
                  owner: prodData['owner'],
                  rating: prodData['rating'],
                  email: prodData['email']));
            })
          : print(2);

      _feedback = loadedProducts;

      notifyListeners();
      print(_feedback);
    } catch (error) {
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
      email}) async {
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
              email: email));
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
