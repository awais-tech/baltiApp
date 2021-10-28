import 'package:flutter/foundation.dart';

import './cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderItem {
  final String id;
  final int amount;
  final List<CartItem> products;
  final DateTime dateTime;
  var status;
  final String email;
  final String phoneno;
  final String name;
  final String createdby;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
    required this.email,
    required this.phoneno,
    required this.name,
    required this.status,
    required this.createdby,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  final String auth;
  final String userId;
  Orders(this.auth, this.userId, this._orders);
  List<OrderItem> get orders {
    return [..._orders];
  }

  bool result(String id) {
    return _orders.every((or) => or.id != id);
  }

  Future<void> fetchAndSetOrders([filterByUser = false]) async {
    try {
      var filterByUse = filterByUser ? 'true' : '';
      final List<OrderItem> loadedOrders = [];
      final url = Uri.parse(
          'https://baltiapi.herokuapp.com/orders/$userId/$filterByUse');

      final response = await http.get(url);
      if (response.body.length < 1 ||
          json.decode(response.body).length < 1 ||
          json.decode(response.body) == null ||
          json.decode(response.body) == 'error' ||
          response.body == 'error') {
        _orders = loadedOrders.toList();

        notifyListeners();
        return;
      }

      final extracted = json.decode(response.body);
      if (filterByUser == false) {
        final extractedUser = extracted['_id'];
        final extractedData = extracted['UserId'];
        final ur =
            Uri.parse('https://baltiapi.herokuapp.com/users/$extractedUser');
        final respons = await http.get(ur);
        final responseData = json.decode(respons.body);

        extractedData.forEach((orderData) {
          loadedOrders.add(
            OrderItem(
              id: orderData['_id'],
              amount: orderData['amount'],
              dateTime: DateTime.parse(orderData['dateTime']),
              status: orderData['status'],
              email: responseData['email'],
              phoneno: responseData['Phoneno'],
              name: responseData['name'],
              createdby: orderData['createdby'],
              products: (orderData['products'] as List<dynamic>)
                  .map(
                    (item) => CartItem(
                      id: item['id'],
                      create: item['createdby'],
                      price: item['price'],
                      quantity: item['quantity'],
                      title: item['title'],
                    ),
                  )
                  .toList(),
            ),
          );
        });
      } else {
        final ur = Uri.parse('https://baltiapi.herokuapp.com/users');
        final respons = await http.get(ur);
        final responseData = json.decode(respons.body);
        extracted.forEach((main) {
          responseData.forEach((mains) {
            if (main['_id'] == mains['Uid']) {
              main['UserId'].forEach((orderData) {
                print(orderData['_id']);
                loadedOrders.add(
                  OrderItem(
                    id: orderData['_id'],
                    amount: orderData['amount'],
                    dateTime: DateTime.parse(orderData['dateTime']),
                    status: orderData['status'],
                    email: mains['email'],
                    phoneno: mains['Phoneno'],
                    name: mains['name'],
                    createdby: orderData['createdby'],
                    products: (orderData['products'] as List<dynamic>)
                        .map(
                          (item) => CartItem(
                            id: item['id'],
                            create: item['createdby'],
                            price: item['price'],
                            quantity: item['quantity'],
                            title: item['title'],
                          ),
                        )
                        .toList(),
                  ),
                );
              });
            }
          });
        });
      }
      _orders = loadedOrders.reversed.toList();

      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> addOrder(List<CartItem> cartProducts, int total) async {
    var url = Uri.parse('https://baltiapi.herokuapp.com/orders/$userId');
    Map<String, String> headers = {"Content-type": "application/json"};
    final timestamp = DateTime.now();
    print(total);
    final response = await http.post(
      url,
      headers: headers,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'status': 'pending',
        'createdby': cartProducts[0].create,
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                  'createdby': cp.create,
                })
            .toList(),
      }),
    );
    // print(json.decode(response.body));
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['_id'],
        amount: total,
        dateTime: timestamp,
        createdby: cartProducts[0].create,
        products: cartProducts,
        email: '',
        phoneno: '',
        name: '',
        status: 'pending',
      ),
    );
    notifyListeners();
  }

  Future<void> update(status, id) async {
    try {
      var url = Uri.parse('https://baltiapi.herokuapp.com/orders/${id}');
      Map<String, String> headers = {"Content-type": "application/json"};

      final response = await http.put(
        url,
        headers: headers,
        body: json.encode({
          'status': status,
        }),
      );
      _orders[(_orders.indexWhere((element) => element.id == id))].status =
          status;
      // var s = _orders
      //     .map(
      //       (val) => val.id == id
      //           ? OrderItem(
      //               id: val.id,
      //               amount: val.amount,
      //               dateTime: val.dateTime,
      //               products: val.products,
      //               status: status,
      //             )
      //           : val,
      //     )
      //     .toList();
      // _orders = s;
      // print(_orders[0].status);
      // print(_orders[5].status);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
