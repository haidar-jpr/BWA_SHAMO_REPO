import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/products_model.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({
    Key? key,
    this.products,
  }) : super(key: key);

  final Products? products;

  final List images = [
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
  ];

  final List familiarShoes = [
    'assets/img_shoes.png',
    'assets/img_shoes2.png',
    'assets/img_shoes3.png',
    'assets/img_shoes4.png',
    'assets/img_shoes5.png',
    'assets/img_shoes6.png',
    'assets/img_shoes7.png',
    'assets/img_shoes8.png',
    'assets/img_shoes9.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor6,
      body: ListView(
        children: [
          ImageSliderProducts(
            products: products,
          ),
          ContentProduct(
            familiarShoes: familiarShoes,
            products: products,
          ),
        ],
      ),
    );
  }
}

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
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
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
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
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

    WishlistProvider wishlist = Provider.of<WishlistProvider>(context);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 17,
      ),
      padding: EdgeInsets.all(
        defaultMargin,
      ),
      decoration: BoxDecoration(
        color: bgColor1,
        borderRadius: BorderRadius.only(
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
                        content: Text(
                          'Has been added to the Wishlist',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: alertColor,
                        content: Text(
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
            padding: EdgeInsets.all(
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
          SizedBox(
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
                    Navigator.pushNamed(context, '/detail-chat');
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(16),
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
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showSuccessDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
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

class FamiliarCardProducts extends StatelessWidget {
  const FamiliarCardProducts({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      margin: EdgeInsets.only(
        right: 16,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          imageUrl,
        ),
      ),
    );
  }
}

class ImageSliderProducts extends StatefulWidget {
  const ImageSliderProducts({
    Key? key,
    this.products,
  }) : super(key: key);

  final Products? products;

  @override
  State<ImageSliderProducts> createState() => _ImageSliderProductsState();
}

class _ImageSliderProductsState extends State<ImageSliderProducts> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    int index = -1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: defaultMargin - 10,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_bag,
                ),
              ),
            ],
          ),
        ),
        CarouselSlider(
          items: widget.products?.galleries
              ?.map(
                (image) => Image.network(
                  '${image.url}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              )
              .toList(),
          options: CarouselOptions(
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(
          height: defaultMargin - 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.products!.galleries?.map(
            (_) {
              index++;
              return IndicatorSliderProducts(
                index: index,
                currentIndex: currentIndex,
              );
            },
          ).toList() as List<Widget>,
        ),
      ],
    );
  }
}

class IndicatorSliderProducts extends StatelessWidget {
  const IndicatorSliderProducts({
    Key? key,
    this.index,
    this.currentIndex,
  }) : super(key: key);

  final int? index;
  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 4,
      ),
      width: currentIndex == index ? 16 : 4,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index ? primaryColor : Color(0XFFC4C4C4),
      ),
    );
  }
}
