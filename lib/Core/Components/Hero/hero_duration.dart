import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/custom_info.dart';

class HeroDuration extends StatelessWidget {
  const HeroDuration({
    super.key,
    required this.tag,
    this.fontSize,
    required this.duration,
  });

  final String duration;
  final String tag;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: CustomInfo(
        info: duration,
        icon: FontAwesomeIcons.solidClock,
        fontSize: fontSize,
      ),
    );
  }
}
