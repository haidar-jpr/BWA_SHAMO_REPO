import 'package:flutter/material.dart';

import '../../../models/products_model.dart';
import '../../../theme.dart';
import '../main/products_page.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({
    Key? key,
    this.products,
  }) : super(key: key);

  final Products? products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ProductsPage(
              products: products,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
        ),
        width: 215,
        height: 278,
        decoration: BoxDecoration(
          color: const Color(0XFFECEDEF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: defaultMargin,
            ),
            Image.network(
              '${products?.galleries?[0].url}',
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${products!.category?.name}',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${products?.name}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${products?.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}