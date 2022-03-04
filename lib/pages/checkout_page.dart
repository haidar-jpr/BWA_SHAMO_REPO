import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/pages/components/loading_btn.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';
import 'package:shamo/theme.dart';

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
          TittleCheckoutPage(
            name: 'Payment Summary',
          ),
          SizedBox(height: 12),
          DetailPaymentCheckout(
            name: 'Product Quantity',
            details: '${cartProvider.totalItem()} Items',
          ),
          SizedBox(height: 13),
          DetailPaymentCheckout(
            name: 'Product Price',
            details: '\$${cartProvider.totalPrice()}',
          ),
          SizedBox(height: 13),
          DetailPaymentCheckout(
            name: 'Shipping',
            details: 'Free',
          ),
          SizedBox(height: 11),
          Divider(
            thickness: 1,
            color: Color(0XFF2E3141),
          ),
          SizedBox(height: 10),
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

class DetailPaymentCheckout extends StatelessWidget {
  const DetailPaymentCheckout({
    Key? key,
    required this.name,
    required this.details,
  }) : super(key: key);

  final String name;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: secondaryTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
        Text(
          details,
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}

class AddressCheckoutPage extends StatelessWidget {
  const AddressCheckoutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TittleCheckoutPage(
            name: 'Address Details',
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icon_store_location.png',
                    width: 40,
                  ),
                  Image.asset(
                    'assets/icon_line.png',
                    height: 45,
                  ),
                  Image.asset(
                    'assets/icon_your_address.png',
                    width: 40,
                  ),
                ],
              ),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationCheckoutPage(
                    storeLocation: 'Store Location',
                    homeLocation: 'Adidas Core',
                  ),
                  SizedBox(height: defaultMargin),
                  LocationCheckoutPage(
                    storeLocation: 'Your Address',
                    homeLocation: 'Marsemoon',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LocationCheckoutPage extends StatelessWidget {
  const LocationCheckoutPage({
    Key? key,
    required this.storeLocation,
    required this.homeLocation,
  }) : super(key: key);

  final String storeLocation;
  final String homeLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          storeLocation,
          style: secondaryTextStyle.copyWith(
            fontWeight: light,
            fontSize: 12,
          ),
        ),
        Text(
          homeLocation,
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}

class ContentCheckoutPage extends StatelessWidget {
  const ContentCheckoutPage({
    Key? key,
    this.cart,
  }) : super(key: key);

  final CartModel? cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin - 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${cart!.products!.galleries![0].url}',
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${cart!.products!.name}',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '\$${cart!.products!.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          Text(
            '${cart!.quantity} Items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class TittleCheckoutPage extends StatelessWidget {
  const TittleCheckoutPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: primaryTextStyle.copyWith(
        fontSize: 16,
        fontWeight: medium,
      ),
    );
  }
}
