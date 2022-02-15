import 'package:flutter/material.dart';
import 'package:shamo/models/products_model.dart';
import 'package:shamo/services/products_service.dart';

class ProductsProvider with ChangeNotifier {
  List<Products> _products = [];

  List<Products> get products => _products;

  set products(List<Products> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<Products> products = await ProductsServices().getProducts();
      _products = products;
    } catch (e) {
      throw Exception(e);
    }
  }
}
