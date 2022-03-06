import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/transaction_provider.dart';
import '../../../theme.dart';
import 'loading_btn.dart';

class ButtonCheckoutPage extends StatefulWidget {
  const ButtonCheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonCheckoutPage> createState() => _ButtonCheckoutPageState();
}

class _ButtonCheckoutPageState extends State<ButtonCheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.checkout(
        authProvider.user.token!,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }

      setState(() {
        isLoading = false;
      });
    }

    return isLoading ? LoadingBtn(txt: 'Loading') : Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: ElevatedButton(
        onPressed: handleCheckout,
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          padding: EdgeInsets.symmetric(
            vertical: 11,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Checkout Now',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}