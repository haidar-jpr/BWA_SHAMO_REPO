import 'package:flutter/material.dart';

import '../../../theme.dart';
import 'account_settings.dart';

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