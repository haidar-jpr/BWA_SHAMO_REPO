import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/products_model.dart';
import '../../../theme.dart';

class ProductPreview extends StatelessWidget {
  ProductPreview({
    Key? key,
    required this.isSender,
    this.products,
  }) : super(key: key);

  final bool isSender;
  Products? products;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 231,
      margin: EdgeInsets.only(
        top: defaultMargin,
        bottom: 12,
      ),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSender ? 12 : 0),
          topRight: Radius.circular(isSender ? 0 : 12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  '${products!.galleries![0].url}',
                  width: 70,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${products!.name}',
                      style: primaryTextStyle,
                    ),
                    Text(
                      '\$${products!.price}',
                      style: priceTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: primaryColor),
                ),
                child: Text(
                  'Add to Cart',
                  style: primaryTextStyle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: primaryColor),
                  backgroundColor: primaryColor,
                ),
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.poppins(
                    color: bgColor5,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
