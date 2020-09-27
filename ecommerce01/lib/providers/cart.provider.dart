import 'package:flutter/widgets.dart';

class Cart extends ChangeNotifier {
  List<Map<String, dynamic>> _cart;

  //modifiers
  void addToCart(Map item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Map item) {
    _cart.remove(item);
    notifyListeners();
  }

  //getters
  get cart => _cart;
}
