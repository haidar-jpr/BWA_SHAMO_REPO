import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products_model.dart';
import '../../../providers/wishlist_provider.dart';
import '../../../theme.dart';

class CardProductWistlist extends StatelessWidget {
  CardProductWistlist({
    this.products,
    Key? key,
  }) : super(key: key);

  final Products? products;

  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${products?.galleries?[0].url}',
              width: 60,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${products?.name}',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${products?.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              wishlistProvider.setProduct(products!);
            },
            child: Image.asset(
              'assets/icon_wistlist_blue.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}