import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.icon,
    this.iconColor,
  });

  final void Function()? onPressed;
  final String text;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(
        text,
        style: AppText.style14Bold(context).copyWith(
          color: iconColor ?? AppColor.primary,
        ),
      ),
      icon: Icon(
        icon,
        color: iconColor ?? AppColor.primary,
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
