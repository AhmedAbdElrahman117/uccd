import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class TermsConditionsTile extends StatelessWidget {
  const TermsConditionsTile({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final void Function(bool? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      activeColor: AppColor.primary,
      title: Text(
        'I Agree',
        style: AppText.style18Bold(context),
      ),
      subtitle: const Text(
        'on Terms and Condition of UCCD Center',
      ),
      value: value,
      controlAffinity: ListTileControlAffinity.leading,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onChanged: onChanged,
    );
  }
}
