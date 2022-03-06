import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../../theme.dart';
import 'cart_card.dart';

class HasCartProducts extends StatelessWidget {
  const HasCartProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return ListView(
      padding: EdgeInsets.all(defaultMargin),
      children: cartProvider.carts
          .map(
            (cart) => CardCart(
              cart: cart,
            ),
          )
          .toList(),
    );
  }
}