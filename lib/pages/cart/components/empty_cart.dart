import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/page_provider.dart';
import '../../../theme.dart';

class EmtyCartPage extends StatelessWidget {
  const EmtyCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PageProvider provider = Provider.of<PageProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_emty_cart.png',
            width: 80,
          ),
          SizedBox(height: 20),
          Text(
            'Opss! Your Cart is Empty',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Let\'s find your favorite shoes',
            style: secondaryTextStyle,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            },
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Explore Store',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
