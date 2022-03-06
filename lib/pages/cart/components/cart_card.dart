import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model.dart';
import '../../../providers/cart_provider.dart';
import '../../../theme.dart';

class CardCart extends StatelessWidget {
  const CardCart({
    Key? key,
    this.cart,
  }) : super(key: key);

  final CartModel? cart;

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  '${cart!.products!.galleries![0].url}',
                  width: 60,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cart!.products!.name}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '\$${cart!.products!.price}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart!.id!);
                    },
                    child: Image.asset(
                      'assets/icon_add.png',
                      width: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${cart!.quantity}',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 2),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart!.id!);
                    },
                    child: Image.asset(
                      'assets/icon_dec.png',
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart!.id!);
            },
            child: Row(
              children: [
                Icon(
                  Icons.delete_outline,
                  size: 15,
                  color: deleteColor,
                ),
                Text(
                  'Remove',
                  style: deleteTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
        
      ),
      
    );
  }
}