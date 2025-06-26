import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    this.fontSize,
    this.fontColor,
  });

  final String title;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Text(
        title,
        style: ThemeHelper.style16Bold(context)
            .copyWith(
              overflow: TextOverflow.ellipsis,
              color: fontColor ?? Theme.of(context).textTheme.bodyMedium!.color,
            )
            .copyWith(
              fontSize: fontSize,
            ),
      ),
    );
  }
}
