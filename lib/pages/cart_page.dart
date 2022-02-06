import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _header(context),
      body: HasCartProducts(),
      bottomNavigationBar: BottomCheckoutCartPage(),
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
        icon: Icon(
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

class BottomCheckoutCartPage extends StatelessWidget {
  const BottomCheckoutCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                '\$287,96',
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
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/checkout');
              },
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
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: defaultMargin - 20),
        ],
      ),
    );
  }
}

class HasCartProducts extends StatelessWidget {
  const HasCartProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(defaultMargin),
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
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
                    child: Image.asset(
                      'assets/img_shoes.png',
                      width: 60,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Terrex Urban Low',
                          style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\$143,98',
                          style: priceTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icon_add.png',
                          width: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '2',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(height: 2),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'assets/icon_dec.png',
                          width: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {},
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
        ),
      ],
    );
  }
}

class EmtyCartPage extends StatelessWidget {
  const EmtyCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
