import 'package:flutter/material.dart';
import 'package:shamo/pages/home/components/categories_item_home.dart';

import '../../../theme.dart';

class CategoriesHome extends StatelessWidget {
  const CategoriesHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin - 1,
        bottom: defaultMargin,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategorieItemsHome(
              name: 'All Shoes',
              containerColor: primaryColor,
              borderColor: primaryColor,
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            CategorieItemsHome(
              name: 'Running',
              containerColor: transparantColor,
              borderColor: subtitleTextColor,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            CategorieItemsHome(
              name: 'Training',
              containerColor: transparantColor,
              borderColor: subtitleTextColor,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            CategorieItemsHome(
              name: 'Basketball',
              containerColor: transparantColor,
              borderColor: subtitleTextColor,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
            CategorieItemsHome(
              name: 'Hiking',
              containerColor: transparantColor,
              borderColor: subtitleTextColor,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}