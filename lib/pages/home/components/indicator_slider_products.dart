import 'package:flutter/material.dart';

import '../../../theme.dart';

class IndicatorSliderProducts extends StatelessWidget {
  const IndicatorSliderProducts({
    Key? key,
    this.index,
    this.currentIndex,
  }) : super(key: key);

  final int? index;
  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 4,
      ),
      width: currentIndex == index ? 16 : 4,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index ? primaryColor : const Color(0XFFC4C4C4),
      ),
    );
  }
}
