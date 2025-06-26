import 'package:flutter/material.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            S.of(context).uccdMobileApp,
            style: TextStyle(
              color: LoginThemeHelper.getFooterPrimaryTextColor(context),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            S.of(context).versionNumber,
            style: TextStyle(
              color: LoginThemeHelper.getFooterSecondaryTextColor(context),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
