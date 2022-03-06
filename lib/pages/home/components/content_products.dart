import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products_model.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/wishlist_provider.dart';
import '../../../theme.dart';
import '../../chats/main/detail_chat.dart';
import 'familiar_card_products.dart';

class ContentProduct extends StatefulWidget {
  const ContentProduct({
    Key? key,
    required this.familiarShoes,
    this.products,
  }) : super(key: key);

  final List familiarShoes;
  final Products? products;

  @override
  State<ContentProduct> createState() => _ContentProductState();
}

class _ContentProductState extends State<ContentProduct> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlist = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: bgColor1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_sucesss.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: secondaryTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/cart-page');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'View My Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 17,
      ),
      padding: EdgeInsets.all(
        defaultMargin,
      ),
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.products?.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '${widget.products?.category?.name}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  wishlist.setProduct(widget.products!);
                  if (wishlist.isWishlist(widget.products!)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: secondaryColor,
                        content: const Text(
                          'Has been added to the Wishlist',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: alertColor,
                        content: const Text(
                          'Has been removed from the Wishlist',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                icon: Image.asset(
                  wishlist.isWishlist(widget.products!)
                      ? 'assets/icon_wistlist_blue.png'
                      : 'assets/icon_wistlist.png',
                  width: 46,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin - 10,
            ),
            padding: const EdgeInsets.all(
              16,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: bgColor2,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price starts from',
                  style: primaryTextStyle,
                ),
                Text(
                  '\$${widget.products?.price}',
                  style: priceTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Text(
            'Description',
            style: primaryTextStyle.copyWith(fontWeight: medium),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            child: Text(
              '${widget.products?.description}',
              style: subtitleTextStyle.copyWith(
                fontWeight: light,
              ),
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin,
              bottom: 12,
            ),
            child: Text(
              'Fimiliar Shoes',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.familiarShoes
                  .map(
                    (image) => FamiliarCardProducts(
                      imageUrl: image,
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DetailChatPage(
                          products: widget.products,
                        ),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    side: BorderSide(
                      width: 1,
                      color: primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Image.asset(
                    'assets/icon_open_chat.png',
                    width: 23,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      cartProvider.addCart(widget.products!);
                      showSuccessDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      primary: primaryColor,
                    ),
                    child: Text(
                      'Add to Cart',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
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