import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class ContinueLearningButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;

  const ContinueLearningButton({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.iconColor = Colors.amber,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: ThemeHelper.paddingH12.add(ThemeHelper.paddingV8),
        decoration: ThemeHelper.getContainerDecoration(
          context,
          color: backgroundColor ??
              ThemeHelper.getAdaptiveColor(
                context,
                lightColor: Colors.white.withAlpha(38),
                darkColor: Colors.black.withAlpha(51),
              ),
          borderRadius: 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              color: iconColor ?? ThemeHelper.appPrimaryColor,
              size: 16,
            ),
            ThemeHelper.gapH8,
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                S.of(context).continueLearningJourney,
                style: ThemeHelper.style14Bold(context).copyWith(
                  color: textColor ??
                      ThemeHelper.getAdaptiveColor(
                        context,
                        lightColor: Colors.white.withAlpha(230),
                        darkColor: Colors.white.withAlpha(204),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
