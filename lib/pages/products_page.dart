import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);

  final List images = [
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
  ];

  final List familiarShoes = [
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
    'assets/img_shoes.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor6,
      body: ListView(
        children: [
          ImageSliderProducts(
            images: images,
          ),
          ContentProduct(familiarShoes: familiarShoes),
        ],
      ),
    );
  }
}

class ContentProduct extends StatelessWidget {
  const ContentProduct({
    Key? key,
    required this.familiarShoes,
  }) : super(key: key);

  final List familiarShoes;

  @override
  Widget build(BuildContext context) {
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
                    'TERREX URBAN LOW',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    'Hiking',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icon_wistlist.png',
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
                  '\$143,98',
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
              "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.",
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
              children: familiarShoes
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
                    onPressed: () {},
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
    required this.images,
  }) : super(key: key);

  final List images;

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
          items: widget.images
              .map(
                (image) => Image.asset(
                  image,
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
          children: widget.images.map((_) {
            index++;
            return IndicatorSliderProducts(
              index: index,
              currentIndex: currentIndex,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class IndicatorSliderProducts extends StatelessWidget {
  const IndicatorSliderProducts({
    Key? key,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  final int index;
  final int currentIndex;

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
