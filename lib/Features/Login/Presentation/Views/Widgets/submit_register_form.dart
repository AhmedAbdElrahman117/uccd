import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class SubmitRegisterForm extends StatelessWidget {
  const SubmitRegisterForm({
    super.key,
    required this.isEnabled,
    this.onPressed,
  });

  final bool isEnabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: isEnabled ? onPressed : null,
      icon: Icon(
        Icons.check,
        color: isEnabled ? Colors.white : Colors.grey,
      ),
      label: Text(
        S.of(context).Submit,
        style: AppText.style14Bold(context).copyWith(
          color: isEnabled ? Colors.white : Colors.grey,
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: isEnabled ? AppColor.primary : Colors.transparent,
      ),
    );
  }
}
