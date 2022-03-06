import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../models/products_model.dart';
import '../../../theme.dart';
import 'indicator_slider_products.dart';

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