import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List<Map<String, dynamic>> _cart = [];
  List<Map<String, dynamic>> get cart => _cart;

  bool addToCart(product) {
    final duplicate = _cart.any((products) => products['id'] == product['id']);
    if (duplicate) {
      return false;
    } else {
      _cart.add(product);
      notifyListeners();
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
}
