import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.title,
    this.onChanged,
    required this.value,
    required this.currentValue,
    this.subtitle,
  });

  final String title;
  final String value;
  final String currentValue;
  final Widget? subtitle;
  final void Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile.adaptive(
      value: value,
      groupValue: currentValue,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      activeColor: AppColor.primary,
      title: Text(
        title,
        style: AppText.style14Bold(context),
      ),
      subtitle: subtitle,
      onChanged: onChanged,
    );
  }
}
