import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
    required this.tag,
    this.horizontalPadding,
    this.verticalPadding,
    required this.imageHeight,
    this.image,
    this.topLeftRadius = 0,
    this.topRightRadius = 0,
    this.bottomLeftRadius = 0,
    this.bottomRightRadius = 0,
    this.fadeFrom = 1,
  });

  final String tag;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double imageHeight;
  final String? image;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double? fadeFrom;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 0),
        child: SizedBox(),
      ),
    );
  }
}
