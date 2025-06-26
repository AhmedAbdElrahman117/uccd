import 'package:flutter/material.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class ORDivider extends StatelessWidget {
  const ORDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: LoginThemeHelper.getDividerColor(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            S.of(context).orDivider,
            style: TextStyle(
              color: LoginThemeHelper.getOrTextColor(context),
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: LoginThemeHelper.getDividerColor(
              context,
            ),
          ),
        ),
      ],
    );
  }
}
