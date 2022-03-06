import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutSuccesss extends StatelessWidget {
  const CheckoutSuccesss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _header(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_emty_cart.png',
              width: 80,
            ),
            const SizedBox(height: 20),
            Text(
              'You made a transaction',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Stay at home while we \nprepare your dream shoes',
              style: secondaryTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: defaultMargin),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(
                  double.infinity,
                  44,
                ),
              ),
              child: Text(
                'Order Other Shoes',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color(0XFF39374B),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(
                  double.infinity,
                  44,
                ),
              ),
              child: Text(
                'View My Order',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _header() {
    return AppBar(
      backgroundColor: bgColor1,
      title: Text(
        'Checkout Success',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
