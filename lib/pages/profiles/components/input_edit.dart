import 'package:flutter/material.dart';

import '../../../theme.dart';

class InputEditProfile extends StatelessWidget {
  const InputEditProfile({
    Key? key,
    required this.name,
    required this.hint,
  }) : super(key: key);

  final String name;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: subtitleTextStyle.copyWith(
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          style: primaryTextStyle,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: primaryTextStyle.copyWith(
              fontSize: 16,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: subtitleTextColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}