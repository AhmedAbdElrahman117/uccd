import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/custom_info.dart';

class HeroDate extends StatelessWidget {
  const HeroDate({
    super.key,
    required this.tag,
    this.fontSize,
    required this.date,
    this.icon,
  });

  final String date;
  final String tag;
  final double? fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: CustomInfo(
        info: date,
        icon: icon ?? FontAwesomeIcons.solidCalendar,
        fontSize: fontSize,
      ),
    );
  }
}
