// import 'dart:convert';
// import 'dart:js_interop';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Cart extends ChangeNotifier {
  List<Map<String, dynamic>> _cart = [];
  List<Map<String, dynamic>> get cart => _cart;

  bool addToCart(product) {
    final duplicate = _cart.any((products) => products['id'] == product['id']);
    if (duplicate) {
      return false;
    } else {
      _cart.add(product);
      notifyListeners();
      // saveCart();

      return true;
    }
  }

  double get getTotal {
    final getTotalProductInCart =
        _cart.fold(0.0, (sum, acc) => sum + (acc['price'] * acc['quantity']));
    return getTotalProductInCart;
  }

  void increaseQuantity(product) {
    // final index = _cart.indexWhere((item) => item['id'] == product['id']);

    final index =
        _cart.firstWhere((products) => products['id'] == product['id']);

    index['quantity'] += 1;
    notifyListeners();
  }

  void decreaseQuantity(product) {
    // final index = _cart.indexWhere((item) => item['id'] == product['id']);

    final index =
        _cart.firstWhere((products) => products['id'] == product['id']);

    index['quantity'] -= 1;
    notifyListeners();
  }

  void deleteProduct(product) {
    final delete = _cart.indexWhere((item) => item['id'] == product['id']);
    if (delete != -1) {
      _cart.remove(product);
      notifyListeners();
    }
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('Josh');

    if (cartData != null) {
      // Decode JSON string into List<Map<String, dynamic>>
      _cart = List<Map<String, dynamic>>.from(jsonDecode(cartData));
    }
    notifyListeners();
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = jsonEncode(_cart);
    await prefs.setString('Josh', cartData);
  }

  bool get login {
    return true;
  }
}
