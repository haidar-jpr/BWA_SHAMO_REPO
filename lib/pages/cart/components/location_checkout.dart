import 'package:flutter/material.dart';

import '../../../theme.dart';

class LocationCheckoutPage extends StatelessWidget {
  const LocationCheckoutPage({
    Key? key,
    required this.storeLocation,
    required this.homeLocation,
  }) : super(key: key);

  final String storeLocation;
  final String homeLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          storeLocation,
          style: secondaryTextStyle.copyWith(
            fontWeight: light,
            fontSize: 12,
          ),
        ),
        Text(
          homeLocation,
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}