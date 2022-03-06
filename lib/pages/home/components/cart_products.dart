import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/products_provider.dart';
import '../../../theme.dart';
import 'products_item.dart';
import '../main/home_page.dart';

class CardProductsHome extends StatelessWidget {
  const CardProductsHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: defaultMargin,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: productsProvider.products
              .map(
                (products) => ProductItems(
                  products: products,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}