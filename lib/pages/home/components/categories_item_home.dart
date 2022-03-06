import 'package:flutter/material.dart';

class CategorieItemsHome extends StatelessWidget {
  const CategorieItemsHome({
    Key? key,
    required this.name,
    required this.style,
    required this.containerColor,
    required this.borderColor,
  }) : super(key: key);

  final String name;
  final Color containerColor;
  final TextStyle style;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(
        right: 16,
      ),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: Text(
        name,
        style: style,
      ),
    );
  }
}