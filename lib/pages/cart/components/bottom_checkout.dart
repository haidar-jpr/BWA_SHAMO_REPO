import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../../theme.dart';

class BottomCheckoutCartPage extends StatelessWidget {
  const BottomCheckoutCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      height: 165,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: primaryTextStyle,
              ),
              Text(
                '\$${cartProvider.totalPrice()}',
                style: priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          Divider(
            color: subtitleTextColor,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Continue to Checkout',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: defaultMargin - 20),
        ],
      ),
    );
  }
}