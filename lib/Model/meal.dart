import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Meal with ChangeNotifier {
  final String id;

  final String title;
  final String imageUrl;

  final String ResturentName;
  String Category;
  final String Dilvery;
  final int duration;
  final int price;
  final String description;
  final String createdby;
  bool isFavorite;

  Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.ResturentName,
    required this.Category,
    required this.Dilvery,
    required this.price,
    required this.description,
    required this.createdby,
    this.isFavorite = false,
  });
  void toggleFavoriteStatus(ids) async {
    var old = isFavorite;
    final url = Uri.parse('https://baltiapi.herokuapp.com/Favourite/${ids}');
    Map<String, String> headers = {"Content-type": "application/json"};

    await http.post(url,
        headers: headers,
        body: json.encode({
          'status': !isFavorite,
          'id': id,
        }));

    isFavorite = !isFavorite;
    notifyListeners();
  }
}
