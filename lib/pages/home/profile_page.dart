import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor3,
        body: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: bgColor1,
              elevation: 0,
              flexibleSpace: SafeArea(
                child: Container(
                  margin: EdgeInsets.all(defaultMargin),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon_default_wall.png',
                        width: 64,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hallo, Subhan Ikraam Haidar',
                              style: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 20,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            FittedBox(
                              child: Text(
                                'haidar.dod@gmail.com',
                                style: subtitleTextStyle.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icon_exit.png',
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
