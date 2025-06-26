import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class WelcomeText extends StatelessWidget {
  final Color? textColor;
  final Color? iconColor;
  final double? iconSize;

  const WelcomeText({
    super.key,
    this.textColor,
    this.iconColor = Colors.amber,
    this.iconSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.of(context).welcomeBackComma,
            style: ThemeHelper.style16Regular(context).copyWith(
              color: textColor ?? Colors.white.withAlpha(230),
              letterSpacing: 0.5,
            ),
          ),
        ),
        Icon(
          Icons.waving_hand_rounded,
          color: iconColor,
          size: iconSize,
        ),
      ],
    );
  }
}
