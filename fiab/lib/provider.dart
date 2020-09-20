import 'package:flutter/widgets.dart';

class FiabProvider extends ChangeNotifier {
  List _data = [];
  List _products;

  saveData(List data) {
    _data = data;
    notifyListeners();
  }

  saveProducts(List data) {
    _products = data;
    notifyListeners();
  }

  get data => _data;
  get products => _products;
}
