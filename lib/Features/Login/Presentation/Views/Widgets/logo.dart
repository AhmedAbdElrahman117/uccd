import 'package:flutter/material.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_helper.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: LoginThemeHelper.getLogoBackgroundColor(context),
          border: LoginThemeHelper.getLogoBorder(context),
          boxShadow: LoginThemeHelper.getLogoShadows(context),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          child: Image.asset(
            AppAssets.imagesUCCDLOGO,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
