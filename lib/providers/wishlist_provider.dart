import 'package:flutter/material.dart';
import 'package:shamo/models/products_model.dart';

class WishlistProvider with ChangeNotifier{
  List<Products> _wishlist = [];

  List<Products> get wishlist => _wishlist;

  set wishlist(List<Products> wishlist){
    _wishlist = wishlist;
    notifyListeners();
  }  

  setProduct(Products product){
    if (!isWishlist(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }

    notifyListeners();
  }

  isWishlist(Products products){
    if(_wishlist.indexWhere((element) => element.id == products.id) == -1){
      return false;
    }else{
      return true;
    }
  }
}