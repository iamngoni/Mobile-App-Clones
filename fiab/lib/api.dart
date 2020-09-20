import 'dart:convert';

import 'package:flutter/services.dart';

class FiabApi {
  Future<String> _loadCategories() async {
    return await rootBundle.loadString('assets/data/categories.json');
  }

  Future<String> _loadProducts() async {
    return await rootBundle.loadString('assets/data/products.json');
  }

  loadCategories() async {
    String jsonData = await _loadCategories();
    return json.decode(jsonData);
  }

  loadProducts() async {
    String jsonData = await _loadProducts();
    return json.decode(jsonData);
  }
}
