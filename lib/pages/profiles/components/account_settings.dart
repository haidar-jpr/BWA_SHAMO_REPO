import 'package:flutter/material.dart';

import '../../../theme.dart';

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

