import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/page_provider.dart';
import '../../../theme.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PageProvider pageProvider = Provider.of<PageProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_love.png',
            width: 80,
          ),
          const SizedBox(height: 20),
          Text(
            ' You don\'t have dream shoes?',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Let\'s find your favorite shoes',
            style: secondaryTextStyle,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              pageProvider.currentIndex = 0;
            },
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            child: Text(
              'Explore Store',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
