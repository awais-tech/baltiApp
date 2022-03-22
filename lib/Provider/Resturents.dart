import 'package:balti/Model/Resturent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Resturents with ChangeNotifier {
  String Auth;
  String userid;
  Resturents(this.Auth, this.resturents, this.userid);

  List<Resturent> resturents = [];
  List<Resturent> get items {
    return [...resturents];
  }

  Resturent findById(String id) {
    return items.firstWhere((prod) => prod.id == id);
  }

  List<Resturent> findByresturent(String name) {
    return items.where((prod) => prod.name.contains(name)).toList();
  }

  List<Resturent> findowner() {
    return items.where((prod) => prod.createdby == userid).toList();
  }

  Future<void> fetchAndSetResturents() async {
    var url = Uri.parse('https://baltiapi.herokuapp.com/Resturent');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      print(extractedData);
      final List<Resturent> loadedResturents = [];
      extractedData != Null
          ? extractedData.forEach((prodData) {
              loadedResturents.add(Resturent(
                id: prodData['_id'],
                name: prodData['Name'],
                description: prodData['description'],
                imageUrl:
                    prodData['imageUrl'] == null ? "" : prodData['imageUrl'],
                location: prodData['Location'],
                createdby: prodData['createdby'],
              ));
            })
          : print(2);

      resturents = loadedResturents;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> deleteResturent(String id) async {
    print(2);
    final url = Uri.parse('https://baltiapi.herokuapp.com/Resturent/$id');
    Map<String, String> headers = {"Content-type": "application/json"};
    final existingResturentIndex =
        resturents.indexWhere((prod) => prod.id == id);

    Resturent? existingResturent = items[existingResturentIndex];

    resturents.removeAt(existingResturentIndex);
    notifyListeners();
    final response = await http.delete(url, headers: headers);
    if (response.statusCode >= 400) {
      resturents.insert(existingResturentIndex, existingResturent);
      notifyListeners();
      throw 'Could not delete Resturent.';
    }
    existingResturent = null;
  }

  Future<void> addResturent(Resturent resturent) async {
    try {
      final url = Uri.parse('https://baltiapi.herokuapp.com/Resturent');
      Map<String, String> headers = {"Content-type": "application/json"};
      print(url);
      var doc = await http.post(
        url,
        headers: headers,
        body: json.encode({
          'Name': resturent.name,
          'description': resturent.description,
          'imageUrl': resturent.imageUrl,
          'Location': resturent.location,
          'createdby': userid,
        }),
      );

      final newResturent = Resturent(
        id: json.decode(doc.body)['_id'],
        name: resturent.name,
        description: resturent.description,
        imageUrl: resturent.imageUrl,
        location: resturent.location,
        createdby: userid,
      );
      resturents.add(newResturent);
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> updateResturent(Resturent resturent) async {
    try {
      final prodIndex = items.indexWhere((prod) => prod.id == resturent.id);
      print(prodIndex);
      if (prodIndex >= 0) {
        final url = Uri.parse(
            'https://baltiapi.herokuapp.com/Resturent/${resturent.id}');
        Map<String, String> headers = {"Content-type": "application/json"};
        await http.put(url,
            headers: headers,
            body: json.encode({
              'Name': resturent.name,
              'description': resturent.description,
              'imageUrl': resturent.imageUrl,
              'Loocation': resturent.location,
            }));

        resturents[prodIndex] = resturent;

        notifyListeners();
      } else {
        print('...');
      }
    } catch (e) {
      throw e;
    }
  }
}
