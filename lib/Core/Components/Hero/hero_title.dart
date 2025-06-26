import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/custom_title.dart';

class HeroTitle extends StatelessWidget {
  const HeroTitle({
    super.key,
    required this.tag,
    this.fontSize,
    this.fontColor,
    required this.title,
  });

  final String title;
  final String tag;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: CustomTitle(
        title: title,
        fontSize: fontSize,
        fontColor: fontColor,
      ),
    );
  }
}
