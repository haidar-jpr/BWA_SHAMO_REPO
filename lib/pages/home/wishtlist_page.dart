import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _appbarWishlist(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // EmptyWishlist(),
          FavoriteWistlist()
        ],
      ),
    );
  }

  AppBar _appbarWishlist() {
    return AppBar(
      backgroundColor: bgColor1,
      title: Text(
        'Favorite Shoes',
        style: primaryTextStyle.copyWith(
          fontWeight: medium,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }
}

class FavoriteWistlist extends StatelessWidget {
  const FavoriteWistlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
            CardProductWistlist(),
          ],
        ),
      ),
    );
  }
}

class CardProductWistlist extends StatelessWidget {
  const CardProductWistlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/img_shoes.png',
              width: 60,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Terrex Urban Low',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$143,98',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/icon_wistlist_blue.png',
            width: 34,
          ),
        ],
      ),
    );
  }
}

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_love.png',
            width: 80,
          ),
          SizedBox(height: 20),
          Text(
            ' You don\'t have dream shoes?',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Let\'s find your favorite shoes',
            style: secondaryTextStyle,
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
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
