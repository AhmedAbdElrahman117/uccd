import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllPressed;
  const SectionHeader({
    super.key,
    required this.title,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: ThemeHelper.style18Bold(context).copyWith(
            color: textColor,
          ),
        ),
        TextButton(
          onPressed: onViewAllPressed,
          child: Text(
            S.of(context).viewAll,
            style: ThemeHelper.style14Bold(context).copyWith(
              color: ThemeHelper.appPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
