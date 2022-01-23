import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Utilities with ChangeNotifier {
  // List<String> _category = [];
  // List<String> _policestation = [];
  List<Map<String, dynamic>> category = [
    {"label": "2", "value": "3"}
  ];

  Future<void> fetchAndSetProducts() async {
    var url = Uri.parse('https://baltiapi.herokuapp.com/Category');
    try {
      final response = await http.get(url);
      print(response.body);
      var extractedData = json.decode(response.body);
      var c = extractedData.map((val) => Map<String, dynamic>.from(
          {"label": val["Cat"], "value": val["Cat"].toString()}));

      category = new List<Map<String, dynamic>>.from(c);
      print(category);
      // category = new List<String>.from((extractedData)['category']);

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  // Future fetchCategoryFromServer() async {
  //   // CollectionReference areas = cloudFirstoreInstance.collection('utilities');
  //   // final result = (await areas.doc('SubCategory').get());
  //   // _subcategory = new Map<String, List<dynamic>>.from(result.data() as Map);

  //   notifyListeners();
  // }

  List<Map<String, dynamic>> get categorys {
    return category;
  }
}
