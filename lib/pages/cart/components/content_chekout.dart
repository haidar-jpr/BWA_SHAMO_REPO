import 'package:flutter/material.dart';

import '../../../models/cart_model.dart';
import '../../../theme.dart';

class ContentCheckoutPage extends StatelessWidget {
  const ContentCheckoutPage({
    Key? key,
    this.cart,
  }) : super(key: key);

  final CartModel? cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin - 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${cart!.products!.galleries![0].url}',
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cart!.products!.name}',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '\$${cart!.products!.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          Text(
            '${cart!.quantity} Items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}