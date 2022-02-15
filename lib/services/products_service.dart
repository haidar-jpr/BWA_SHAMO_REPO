import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/products_model.dart';

class ProductsServices {
  String baseURL = 'https://shamo-backend.buildwithangga.id/api';

  Future<List<Products>> getProducts() async {
    Uri url = Uri.parse('$baseURL/products');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      
      List<Products> products = [];

      for (var item in data) {
        products.add(Products.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Mengambil Products!');
    }
  }
}
