import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      appBar: _appBar(),
      bottomNavigationBar: InputChat(),
      body: Container(),
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

class InputChat extends StatelessWidget {
  const InputChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
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
    );
  }
}
