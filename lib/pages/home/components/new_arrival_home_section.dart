import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/products_provider.dart';
import '../../../theme.dart';
import '../main/home_page.dart';
import 'new_arrival_item.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsProvider productsProvider = Provider.of<ProductsProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 14,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: Wrap(
        children: productsProvider.products
            .map(
              (products) => NewArrivalItems(
                products: products,
              ),
            )
            .toList(),
      ),
    );
  }
}