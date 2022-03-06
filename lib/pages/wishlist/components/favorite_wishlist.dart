import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/wishlist_provider.dart';
import '../../../theme.dart';
import '../main/wishtlist_page.dart';
import 'cart_products.dart';

class FavoriteWistlist extends StatelessWidget {
  const FavoriteWistlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Expanded(
      child: Container(
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: wishlistProvider.wishlist
              .map(
                (product) => CardProductWistlist(products: product,),
              )
              .toList(),
        ),
      ),
    );
  }
}