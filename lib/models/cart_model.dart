import 'package:shamo/models/products_model.dart';

class CartModel{
  int? id;
  Products? products;
  int? quantity;

  CartModel({
    this.id,
    this.products,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    products = Products.fromJson(json['products']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'products': products?.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice(){
    return products!.price! * quantity!;
  }
}