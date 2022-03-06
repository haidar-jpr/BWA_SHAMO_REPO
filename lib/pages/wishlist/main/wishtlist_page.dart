import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

import '../components/empty_wishlist.dart';
import '../components/favorite_wishlist.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _appbarWishlist(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          wishlistProvider.wishlist.length == 0
              ? EmptyWishlist()
              : FavoriteWistlist()
        ],
      ),
    );
  }

  AppBar _appbarWishlist() {
    return AppBar(
      backgroundColor: bgColor1,
      title: Text(
        'Favorite Shoes',
        style: primaryTextStyle.copyWith(
          fontWeight: medium,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }
}