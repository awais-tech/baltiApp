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

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
    required this.status,
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

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse('https://baltiapi.herokuapp.com/orders/$userId');
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extracted = json.decode(response.body);
    final extractedData = extracted['UserId'];
    if (extractedData == null) {
      return;
    }
    print(extractedData);
    extractedData.forEach((orderData) {
      loadedOrders.add(
        OrderItem(
          id: orderData['_id'],
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          status: orderData['status'],
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
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
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
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
        products: cartProducts,
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
