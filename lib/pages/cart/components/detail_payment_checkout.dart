import 'package:flutter/material.dart';

import '../../../theme.dart';

class DetailPaymentCheckout extends StatelessWidget {
  const DetailPaymentCheckout({
    Key? key,
    required this.name,
    required this.details,
  }) : super(key: key);

  final String name;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: secondaryTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
        Text(
          details,
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}