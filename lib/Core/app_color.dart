import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFFF7B626);

  static const Color secondry = Color(0xFF006400);

  static const Color secondryDark = Color(0xFF42AE59);

  static const List<Color> secondryGradient = [
    Color(0xFF4B84B8),
    Color(0xFF42AD5A),
    Color(0xFF44A769),
  ];

  static const Color thirdColor = Color(0xFFCC3027);

  static Color applySecondary(BuildContext context) {
    if (Theme.of(context).brightness.index == 0) {
      return secondryDark;
    } else {
      return secondry;
    }
  }
}
