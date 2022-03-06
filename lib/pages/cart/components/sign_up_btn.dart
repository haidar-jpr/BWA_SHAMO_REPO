import 'package:flutter/material.dart';

import '../../../theme.dart';

class SignUpButton extends StatelessWidget {
  final String txt;
  final VoidCallback to;

  const SignUpButton({Key? key, required this.txt, required this.to})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: to,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: primaryColor,
        ),
        child: Text(
          txt,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
