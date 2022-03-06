import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';

import '../components/bottom_checkout.dart';
import '../components/empty_cart.dart';
import '../components/has_cart_products.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _header(context),
      body: cartProvider.carts.isEmpty ? const EmtyCartPage() : const HasCartProducts(),
      bottomNavigationBar: cartProvider.carts.isEmpty ? const SizedBox() : const BottomCheckoutCartPage(),
    );
  }

  AppBar _header(context) {
    return AppBar(
      backgroundColor: bgColor1,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
      title: Text(
        'Your Cart',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
      centerTitle: true,
    );
  }
}