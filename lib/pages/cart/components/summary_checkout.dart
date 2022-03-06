import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';
import '../../../theme.dart';
import 'detail_payment_checkout.dart';
import 'title_chekout.dart';

class SummaryCheckoutPage extends StatelessWidget {
  const SummaryCheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      padding: EdgeInsets.all(
        defaultMargin,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TittleCheckoutPage(
            name: 'Payment Summary',
          ),
          const SizedBox(height: 12),
          DetailPaymentCheckout(
            name: 'Product Quantity',
            details: '${cartProvider.totalItem()} Items',
          ),
          const SizedBox(height: 13),
          DetailPaymentCheckout(
            name: 'Product Price',
            details: '\$${cartProvider.totalPrice()}',
          ),
          const SizedBox(height: 13),
          const DetailPaymentCheckout(
            name: 'Shipping',
            details: 'Free',
          ),
          const SizedBox(height: 11),
          const Divider(
            thickness: 1,
            color: Color(0XFF2E3141),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: priceTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                '\$${cartProvider.totalPrice()}',
                style: priceTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}