import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

import '../components/cart_products.dart';
import '../components/categories_home.dart';
import '../components/header_home_page.dart';
import '../components/new_arrival_home.dart';
import '../components/new_arrival_home_section.dart';
import '../components/popular_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: ListView(
        children: const [
          HeaderHomePage(),
          CategoriesHome(),
          PopularProductsHome(),
          CardProductsHome(),
          NewArrivalHome(),
          NewArrivalSection(),
        ],
      ),
    );
  }
}