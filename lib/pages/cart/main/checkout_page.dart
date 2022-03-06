import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/theme.dart';

import '../components/address_chekout.dart';
import '../components/btn_checkout.dart';
import '../components/content_chekout.dart';
import '../components/summary_checkout.dart';
import '../components/title_chekout.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _header(context),
      body: ListView(
        padding: EdgeInsets.all(
          defaultMargin,
        ),
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TittleCheckoutPage(
                  name: 'List Items',
                ),
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => ContentCheckoutPage(
                          cart: cart,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: defaultMargin),
          AddressCheckoutPage(),
          SizedBox(height: defaultMargin),
          SummaryCheckoutPage(),
          SizedBox(height: defaultMargin),
          Divider(
            thickness: 1,
            color: bgColor2,
          ),
          SizedBox(height: defaultMargin),
          ButtonCheckoutPage(),
        ],
      ),
    );
  }

  AppBar _header(ctx) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(ctx);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
      title: Text(
        'Checkout Details',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
      centerTitle: true,
      backgroundColor: bgColor1,
      elevation: 0,
    );
  }
}