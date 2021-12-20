import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      body: Column(
        children: [
          AppBarChat(),
          // EmtyChat(),
          HaveChat(),
        ],
      ),
    );
  }
}

class HaveChat extends StatelessWidget {
  const HaveChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail-chat');
        },
        child: Container(
          width: double.infinity,
          color: bgColor3,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 33,
                ),
                width: 315,
                height: 67,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon_logo_shop.png',
                      width: 54,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shoe Store',
                            style: primaryTextStyle.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Good night, This item is on This item',
                            style:
                                secondaryTextStyle.copyWith(fontWeight: light),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Now',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: subtitleTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmtyChat extends StatelessWidget {
  const EmtyChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: bgColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_headset.png',
              width: 80,
            ),
            const SizedBox(height: 20),
            Text(
              'Opss no message yet?',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'You have never done a transaction',
              style: secondaryTextStyle,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Explore Store',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarChat extends StatelessWidget {
  const AppBarChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor1,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Message Support',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
    );
  }
}
