import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/cart_model.dart';

class TransactionService {
  String baseURL = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = Uri.parse('$baseURL/checkout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode(
      {
        'address': 'Marsemoon',
        'items': carts
            .map(
              (cart) => {
                'id': cart.products!.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': 'PENDING',
        'total_price': totalPrice,
        'shipping_price': 0,
      },
    );

    var response = await http.post(url,headers: headers,body: body);

    if(response.statusCode == 200){
      return true;
    }else{
      throw Exception('Gagal checkout!');
    }
  }
}
