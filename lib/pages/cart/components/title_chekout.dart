import 'package:flutter/material.dart';

import '../../../theme.dart';

class TittleCheckoutPage extends StatelessWidget {
  const TittleCheckoutPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: primaryTextStyle.copyWith(
        fontSize: 16,
        fontWeight: medium,
      ),
    );
  }
}
