import 'package:flutter/cupertino.dart';

class Meal with ChangeNotifier {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;

  final String ResturentName;
  final String Category;
  final String Dilvery;
  final int duration;
  bool isFavorite;

  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.ResturentName,
    required this.Category,
    required this.Dilvery,
    this.isFavorite = false,
  });
  void toggleFavoriteStatus() {
    var old = isFavorite;

    isFavorite = !isFavorite;
    notifyListeners();
  }
}
