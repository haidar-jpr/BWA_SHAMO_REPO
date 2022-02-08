import 'package:flutter/material.dart';

import '../../theme.dart';

class LoadingSignUpBtn extends StatelessWidget {
  final String txt;
  final VoidCallback to;

  const LoadingSignUpBtn({Key? key, required this.txt, required this.to})
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  primaryTextColor,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              txt,
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
