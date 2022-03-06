import 'package:flutter/material.dart';

import '../../../theme.dart';

class HeaderEditProfile extends StatelessWidget {
  const HeaderEditProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor1,
      elevation: 0,
      title: Text(
        'Edit Profile',
        style: primaryTextStyle.copyWith(
          fontWeight: medium,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.check,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
