import 'package:balti/Model/Resturent.dart';
import 'package:balti/Model/meal.dart';
import 'package:balti/Screens/Constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:collection/collection.dart';

class BaltiMeals with ChangeNotifier {
  String Auth;
  String userid;
  BaltiMeals(this.Auth, this.meals, this.userid);

  List<Meal> meals = [
    // Meal(
    //   id: 'm1',
    //   title: 'Chill out deals',
    //   ResturentName: 'Subway',
    //   Category: 'Chinese',
    //   price: 20,
    //   description:
    //       'Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy now Its new products you can buy nowIts new products you can buy now Its new products you can buy now Its new products you can buy now',
    //   Dilvery: '45 Dilvery Fee',
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    //   duration: 20,
    // ),
    // Meal(
    //   id: 'm1',
    //   title: 'Chill out deals',
    //   ResturentName: 'Subway',
    //   Category: 'Chinese',
    //   Dilvery: '45 Dilvery Fee',
    //   price: 20,
    //   description: 'Its new products you can buy now',
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    //   duration: 20,
    // ),
    // Meal(
    //     id: 'm7',
    //     title: 'Chill out deals',
    //     ResturentName: 'Subway',
    //     Category: 'Chinese',
    //     Dilvery: '45 Dilvery Fee',
    //     imageUrl:
    //         'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    //     duration: 20,
    //     price: 20,
    //     description: 'Its new products you can buy now'),
    // Meal(
    //   id: 'm2',
    //   title: 'Chill out deals',
    //   ResturentName: 'Subway',
    //   Category: 'Chinese',
    //   Dilvery: '45 Dilvery Fee',
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    //   duration: 10,
    //   price: 20,
    //   description: 'Its new products you can buy now',
    // ),
    // Meal(
    //     id: 'm3',
    //     title: 'Chill out deals',
    //     ResturentName: 'Subway',
    //     Category: 'Chinese',
    //     Dilvery: '45 Dilvery Fee',
    //     imageUrl:
    //         'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    //     duration: 45,
    //     price: 20,
    //     description: 'Its new products you can buy now'),
    // Meal(
    //     id: 'm4',
    //     title: 'Chill out deals',
    //     ResturentName: 'Subway',
    //     Category: 'Chinese',
    //     Dilvery: '45 Dilvery Fee',
    //     imageUrl:
    //         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    //     duration: 60,
    //     price: 20,
    //     description: 'Its new products you can buy now')
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

  List<Meal> findowners(String id) {
    return items.where((prod) => prod.createdby == id).toList();
  }

  List<Meal> findByresturent(String name) {
    return items.where((prod) => prod.ResturentName.contains(name)).toList();
  }

  List<Meal> findByresturentandLocation(lat, long, List<Resturent> res) {
    List<Meal> storeproduct = [];
    res.forEach((element) {
      print(element);
      print(Geolocator.distanceBetween(lat, long, lat, long));
      var loc = element.location.split(",");
      print(loc);
      var data = items.firstWhere(
          (prod) => (prod.ResturentName.contains(element.name) &&
              Geolocator.distanceBetween(
                      lat, long, double.parse(loc[0]), double.parse(loc[1])) <
                  2000),
          orElse: () => Meal(
              id: "",
              title: "",
              imageUrl: "",
              duration: 0,
              ResturentName: "",
              Category: "",
              Dilvery: "",
              price: 0,
              description: "",
              createdby: ""));
      if (data.id != "") {
        storeproduct.add(data);
      }
    });

    return storeproduct;
  }

  List<Meal> findowner(id) {
    return items.where((prod) => prod.createdby == id).toList();
  }

  Future<void> fetchAndSetProducts() async {
    var url = Uri.parse('https://baltiapi.herokuapp.com/products');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      // print(extractedData);
      // print(2);
      var userd = await json
          .decode(Constants.prefs.getString('userData') as String)['userId'];
      print(userd);
      var urlfav =
          Uri.parse('https://baltiapi.herokuapp.com/Favourite/${userd}');
      final responsefav = await http.get(urlfav);
      final extractedDatafav = json.decode(responsefav.body);
      print(2);
      print(extractedDatafav);
      print(10);
      final List<Meal> loadedProducts = [];
      var status = false;
      extractedData != Null
          ? extractedData.forEach((prodData) {
              if (extractedDatafav != null &&
                  extractedDatafav["Error"] != "Not found") {
                status = false;
                extractedDatafav["Fav"].forEach((val) {
                  if (val["id"] == prodData['_id']) {
                    status = val["status"];
                  }
                });
              }
              loadedProducts.add(Meal(
                id: prodData['_id'],
                title: prodData['title'],
                description: prodData['description'],
                price: prodData['price'],
                isFavorite: status,
                imageUrl: prodData['imageUrl'],
                duration: prodData['duration'],
                ResturentName: prodData['ResturentName'],
                Category: prodData['Category'],
                Dilvery: prodData['Dilvery'],
                createdby: prodData['createdby'],
              ));
            })
          : print(2);

      meals = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> deleteProduct(String id) async {
    print(2);
    final url = Uri.parse('https://baltiapi.herokuapp.com/products/$id');
    Map<String, String> headers = {"Content-type": "application/json"};
    final existingProductIndex = meals.indexWhere((prod) => prod.id == id);

    Meal? existingProduct = items[existingProductIndex];
    print(existingProductIndex);
    meals.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url, headers: headers);
    if (response.statusCode >= 400) {
      meals.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw 'Could not delete product.';
    }
    existingProduct = null;
  }

  Future<void> addProduct(product, name) async {
    try {
      final url = Uri.parse('https://baltiapi.herokuapp.com/products');
      Map<String, String> headers = {"Content-type": "application/json"};
      print(url);
      var doc = await http.post(
        url,
        headers: headers,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'favourite': false,
          'ResturentName': name,
          'Category': product.Category,
          'Dilvery': product.Dilvery,
          'duration': product.duration,
          'createdby': userid,
        }),
      );

      final newProduct = Meal(
        id: json.decode(doc.body)['_id'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        ResturentName: product.ResturentName,
        Category: product.Category,
        Dilvery: product.Dilvery,
        duration: product.duration,
        createdby: userid,
      );
      meals.add(newProduct);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateProduct(Meal newProduct) async {
    try {
      final prodIndex = items.indexWhere((prod) => prod.id == newProduct.id);
      print(prodIndex);
      if (prodIndex >= 0) {
        final url = Uri.parse(
            'https://baltiapi.herokuapp.com/products/${newProduct.id}');
        Map<String, String> headers = {"Content-type": "application/json"};
        await http.put(url,
            headers: headers,
            body: json.encode({
              'title': newProduct.title,
              'description': newProduct.description,
              'imageUrl': newProduct.imageUrl,
              // 'favourite': newProduct.isFavorite,
              'price': newProduct.price,
              'ResturentName': newProduct.ResturentName,
              'Category': newProduct.Category,
              'Dilvery': newProduct.Dilvery,
              'duration': newProduct.duration,
            }));

        meals[prodIndex] = newProduct;

        notifyListeners();
      } else {
        print('...');
      }
    } catch (e) {
      print('...3');
    }
  }
}
