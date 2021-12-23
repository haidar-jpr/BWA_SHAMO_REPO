import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/theme.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {Key? key,
      required this.chat,
      required this.isSender,
      required this.hasProduct})
      : super(key: key);

  final String chat;
  final bool isSender;
  final bool hasProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      decoration: BoxDecoration(
        color: bgColor3,
      ),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? ProductPreview(isSender: isSender) : SizedBox(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor5,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 12 : 0),
                      topRight: Radius.circular(isSender ? 0 : 12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    chat,
                    style: primaryTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductPreview extends StatelessWidget {
  const ProductPreview({
    Key? key,
    required this.isSender,
  }) : super(key: key);

  final bool isSender;

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
                child: Image.asset(
                  'assets/img_shoes.png',
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
                      'COURT VISION 2.0 SHOES',
                      style: primaryTextStyle,
                    ),
                    Text(
                      '\$57,15',
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
