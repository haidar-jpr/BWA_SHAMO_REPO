import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: ListView(
        children: const [
          HeaderHomePage(),
        ],
      ),
    );
  }
}

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        left: 30,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo, Subhan Ikraam Haidar',
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                Text(
                  'haidar.dod@gmail.com',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          // SizedBox(width: 100),
          Image.asset(
            'assets/icon_default_wall.png',
            width: 54,
            height: 54,
          ),
        ],
      ),
    );
  }
}
