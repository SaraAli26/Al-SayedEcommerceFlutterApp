import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier {
  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;

  void addToCart(index) {
    if (_cart.containsKey(index)) {
      _cart[index] += 1;
    } else {
      _cart[index] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(index) {
    if (_cart.containsKey(index)) {
      _cart[index] -= 1;
    }
    if (_cart.containsKey(index) && _cart[index] == 0){
      _cart.remove(index);
    }
    else {
     // _cart[index] = 0;
    }
    notifyListeners();
  }

  void clear(index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
      notifyListeners();
    }
  }
}