import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/models/products_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cart = [];

  List<CartModel> get carts => _cart;

  set carts(List<CartModel> carts) {
    _cart = carts;
    notifyListeners();
  }

  addCart(Products products) {
    if (isExist(products)) {
      int? index =
          _cart.indexWhere((element) => element.products!.id == products.id);
      _cart[index].quantity = _cart[index].quantity! + 1;
    } else {
      _cart.add(CartModel(
        id: _cart.length,
        products: products,
        quantity: 1,
      ));
    }

    notifyListeners();
  }

  removeCart(int id) {
    _cart.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _cart[id].quantity = _cart[id].quantity! + 1;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _cart[id].quantity = _cart[id].quantity! - 1;
    if (_cart[id].quantity == 0) {
      _cart.removeAt(id);
    }
    notifyListeners();
  }

  totalItem() {
    int total = 0;
    for (var item in _cart) {
      total += item.quantity!;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _cart) {
      total += (item.quantity! * item.products!.price!);
    }
    return total;
  }

  isExist(Products products) {
    if (_cart.indexWhere((element) => element.products!.id == products.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
