
import 'package:flutter/material.dart';
import 'package:shamo/models/products_model.dart';
import 'package:shamo/theme.dart';

import '../main/detail_chat.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    Key? key,
    required this.chat,
    required this.isSender,
    this.products
  }) : super(key: key);

  final String chat;
  final bool isSender;
  late Products? products;

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
          products is UninitializedProductModel ? const SizedBox() : ProductPreview(isSender: isSender, products: products,),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor5,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 12 : 0),
                      topRight: Radius.circular(isSender ? 0 : 12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
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