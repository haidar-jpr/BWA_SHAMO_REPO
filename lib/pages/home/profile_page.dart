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
          HeaderProfile(),
          ContentProfile(),
        ],
      ),
    );
  }
}

class ContentProfile extends StatelessWidget {
  const ContentProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin - 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 16),
            AccountSettings(
              name: 'Edit Profile',
              action: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
            ),
            SizedBox(height: 5),
            AccountSettings(
              name: 'Your Orders',
              action: () {},
            ),
            SizedBox(height: 5),
            AccountSettings(
              name: 'Help',
              action: () {},
            ),
            SizedBox(height: defaultMargin),
            Text(
              'General',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 16),
            AccountSettings(
              name: 'Privacy & Policy',
              action: () {},
            ),
            SizedBox(height: 5),
            AccountSettings(
              name: 'Term of Service',
              action: () {},
            ),
            SizedBox(height: 5),
            AccountSettings(
              name: 'Rate App',
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class AccountSettings extends StatelessWidget {
  const AccountSettings({
    Key? key,
    required this.name,
    required this.action,
  }) : super(key: key);

  final String name;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: secondaryTextStyle.copyWith(fontSize: 13),
        ),
        IconButton(
          onPressed: action,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: subtitleTextColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-in', (route) => false);
                },
                icon: Image.asset(
                  'assets/icon_exit.png',
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
