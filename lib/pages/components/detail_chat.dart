import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/products_model.dart';
import 'package:shamo/pages/components/chat_buble.dart';
import 'package:shamo/providers/products_provider.dart';
import 'package:shamo/theme.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key, this.products}) : super(key: key);

  final Products? products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _appBar(),
      bottomNavigationBar: InputChat(
        products: products,
      ),
      body: Content(),
    );
  }

  PreferredSize _appBar() => PreferredSize(
        child: AppBar(
          backgroundColor: bgColor1,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
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

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      children: [
        ChatBubble(
          isSender: true,
          chat: 'Hi, This item is still available?',
          hasProduct: true,
        ),
        ChatBubble(
          isSender: false,
          chat: 'Good night, This item is only available in size 42 and 43',
          hasProduct: false,
        ),
      ],
    );
  }
}

class ProductPreview extends StatefulWidget {
  ProductPreview({Key? key, this.products}) : super(key: key);

  Products? products;

  @override
  State<ProductPreview> createState() => _ProductPreviewState();
}

class _ProductPreviewState extends State<ProductPreview> {
  @override
  Widget build(BuildContext context) {
    return widget.products?.id == null ? SizedBox() : Container(
      width: 225,
      height: 74,
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      padding: EdgeInsets.all(10),
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
          SizedBox(
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
            onTap: (){
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

class InputChat extends StatefulWidget {
  const InputChat({
    Key? key,
    this.products,
  }) : super(key: key);

  final Products? products;

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.products is UninitializedProductModel ? SizedBox() : ProductPreview(products: widget.products,),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Typle Message...',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icon_submit.png',
                  width: 40,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
