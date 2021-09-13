import 'package:flutter/cupertino.dart';

class Meal with ChangeNotifier {
  final String id;

  final String title;
  final String imageUrl;

  final String ResturentName;
  final String Category;
  final String Dilvery;
  final int duration;
  final int price;
  final String description;
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
    this.isFavorite = false,
  });
  void toggleFavoriteStatus() {
    var old = isFavorite;

    isFavorite = !isFavorite;
    notifyListeners();
  }
}
