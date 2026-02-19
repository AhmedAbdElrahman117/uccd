import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/custom_info.dart';

class HeroLocation extends StatelessWidget {
  const HeroLocation({
    super.key,
    required this.tag,
    this.fontSize,
    required this.location,
  });

  final String location;
  final String tag;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: CustomInfo(
        info: location,
        icon: FontAwesomeIcons.locationDot,
        fontSize: fontSize,
      ),
    );
  }
}
