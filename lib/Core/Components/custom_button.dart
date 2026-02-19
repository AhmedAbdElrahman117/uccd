import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.titleReplacement,
    this.icon,
    this.verticalSize,
    this.backgroundColor,
  });

  final void Function()? onPressed;
  final Widget? titleReplacement;
  final String title;
  final IconData? icon;
  final double? verticalSize;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: ThemeHelper.borderRadius12,
      color: onPressed == null
          ? context.isDarkTheme
              ? Colors.grey.shade800
              : Colors.grey.shade400
          : backgroundColor ?? ThemeHelper.appPrimaryColor,
      elevation: ThemeHelper.elevation4,
      child: InkWell(
        onTap: onPressed,
        borderRadius: ThemeHelper.borderRadius12,
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: verticalSize ?? 14,
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Visibility(
                visible: icon != null,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: titleReplacement ??
                    Text(
                      title,
                      style: ThemeHelper.style18Bold(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
