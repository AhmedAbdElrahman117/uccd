import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

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
        S.of(context).IAgree,
        style: AppText.style18Bold(context),
      ),
      subtitle: Text(
        S.of(context).onTerms,
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
