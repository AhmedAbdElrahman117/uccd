import 'package:flutter/material.dart';
import 'package:uccd/Core/app_banners.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class ContactSupportButton extends StatelessWidget {
  const ContactSupportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        AppBanners.showComingSoon(context);
      },
      icon: Icon(
        Icons.support_agent,
        color: LoginThemeHelper.getSupportButtonIconColor(context),
      ),
      label: Text(
        S.of(context).contactSupport,
        style: TextStyle(
          color: LoginThemeHelper.getSupportButtonTextColor(context),
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        side: LoginThemeHelper.getSupportButtonBorder(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
