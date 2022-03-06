import 'package:flutter/material.dart';
import 'package:shamo/models/products_model.dart';
import 'package:shamo/theme.dart';

import '../components/content_products.dart';
import '../components/image_slider_products.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({
    Key? key,
    this.products,
  }) : super(key: key);

  final Products? products;

  final List images = [
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
  ];

  final List familiarShoes = [
    'assets/img_shoes.png',
    'assets/img_shoes2.png',
    'assets/img_shoes3.png',
    'assets/img_shoes4.png',
    'assets/img_shoes5.png',
    'assets/img_shoes6.png',
    'assets/img_shoes7.png',
    'assets/img_shoes8.png',
    'assets/img_shoes9.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor6,
      body: ListView(
        children: [
          ImageSliderProducts(
            products: products,
          ),
          ContentProduct(
            familiarShoes: familiarShoes,
            products: products,
          ),
        ],
      ),
    );
  }
}