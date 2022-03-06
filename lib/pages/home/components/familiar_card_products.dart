import 'package:flutter/material.dart';

class FamiliarCardProducts extends StatelessWidget {
  const FamiliarCardProducts({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      margin: const EdgeInsets.only(
        right: 16,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          imageUrl,
        ),
      ),
    );
  }
}