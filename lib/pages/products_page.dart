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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor6,
      body: ListView(
        children: [
          ImageSliderProducts(
            images: images,
          ),
        ],
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
