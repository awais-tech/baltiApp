import 'package:balti/Model/meal.dart';
import 'package:flutter/material.dart';

class BaltiMeals with ChangeNotifier {
  List<Meal> meals = [
    Meal(
      id: 'm1',
      categories: [
        'c1',
        'c2',
      ],
      title: 'Chill out deals',
      ResturentName: 'Subway',
      Category: 'Chinese',
      price: 20,
      description:
          'Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy nowIts new products you can buy now Its new products you can buy now Its new products you can buy now',
      Dilvery: '45 Dilvery Fee',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      duration: 20,
    ),
    Meal(
      id: 'm1',
      categories: [
        'c1',
        'c2',
      ],
      title: 'Chill out deals',
      ResturentName: 'Subway',
      Category: 'Chinese',
      Dilvery: '45 Dilvery Fee',
      price: 20,
      description: 'Its new products you can buy now',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      duration: 20,
    ),
    Meal(
        id: 'm7',
        categories: [
          'c1',
          'c2',
        ],
        title: 'Chill out deals',
        ResturentName: 'Subway',
        Category: 'Chinese',
        Dilvery: '45 Dilvery Fee',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
        duration: 20,
        price: 20,
        description: 'Its new products you can buy now'),
    Meal(
      id: 'm2',
      categories: [
        'c2',
      ],
      title: 'Chill out deals',
      ResturentName: 'Subway',
      Category: 'Chinese',
      Dilvery: '45 Dilvery Fee',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
      duration: 10,
      price: 20,
      description: 'Its new products you can buy now',
    ),
    Meal(
        id: 'm3',
        categories: [
          'c2',
          'c3',
        ],
        title: 'Chill out deals',
        ResturentName: 'Subway',
        Category: 'Chinese',
        Dilvery: '45 Dilvery Fee',
        imageUrl:
            'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
        duration: 45,
        price: 20,
        description: 'Its new products you can buy now'),
    Meal(
        id: 'm4',
        categories: [
          'c4',
        ],
        title: 'Chill out deals',
        ResturentName: 'Subway',
        Category: 'Chinese',
        Dilvery: '45 Dilvery Fee',
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
        duration: 60,
        price: 20,
        description: 'Its new products you can buy now')
  ];
  List<Meal> get items {
    return [...meals];
  }

  List<Meal> get favoriteItems {
    return meals.where((prodItem) => prodItem.isFavorite).toList();
  }

  Meal findById(String id) {
    return items.firstWhere((prod) => prod.id == id);
  }
}
