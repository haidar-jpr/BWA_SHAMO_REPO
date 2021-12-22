import 'package:flutter/material.dart';
import 'package:shamo/pages/home/components/chat_buble.dart';
import 'package:shamo/theme.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _appBar(),
      bottomNavigationBar: InputChat(),
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

class ProductPreview extends StatelessWidget {
  const ProductPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Image.asset(
              'assets/icon_white_shoes.png',
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
                  'COURT VISIO...',
                  style: primaryTextStyle,
                ),
                Text(
                  '\$57,15',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/icon_close_product.png',
            width: 22,
          ),
        ],
      ),
    );
  }
}

class InputChat extends StatelessWidget {
  const InputChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductPreview(),
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
