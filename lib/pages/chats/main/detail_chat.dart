import 'package:flutter/material.dart';
import 'package:shamo/models/products_model.dart';
import 'package:shamo/theme.dart';

import '../components/content_details.dart';
import '../components/input_chat.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key, this.products}) : super(key: key);

  final Products? products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _appBar(context),
      bottomNavigationBar: InputChat(
        products: products,
      ),
      body: const Content(),
    );
  }

  PreferredSize _appBar(BuildContext context) => PreferredSize(
        child: AppBar(
          backgroundColor: bgColor1,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 25,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icon_logo_online.png',
                        width: 50,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shoe Store',
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                          ),
                          Text(
                            'Online',
                            style: secondaryTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(90),
      );
}

class ProductPreview extends StatefulWidget {
  ProductPreview({Key? key, this.products, bool? isSender}) : super(key: key);

  Products? products;

  @override
  State<ProductPreview> createState() => _ProductPreviewState();
}

class _ProductPreviewState extends State<ProductPreview> {
  @override
  Widget build(BuildContext context) {
    return widget.products?.id == null
        ? const SizedBox()
        : Container(
            width: 225,
            height: 74,
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor5,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    '${widget.products?.galleries?[0].url}',
                    width: 54,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.products?.name}',
                        style: primaryTextStyle,
                        maxLines: 1,
                      ),
                      Text(
                        '\$${widget.products?.price}',
                        style: priceTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.products = UninitializedProductModel();
                    });
                  },
                  child: Image.asset(
                    'assets/icon_close_product.png',
                    width: 22,
                  ),
                ),
              ],
            ),
          );
  }
}
