import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Features/Login/Presentation/Views/Widgets/login_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          Text(
            S.of(context).welcomeTo,
            style: ThemeHelper.style28Bold(context).copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: LoginThemeHelper.getWelcomeTextColor(context),
            ),
          ),
          Hero(
            tag: 'splash-text',
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                'UCCD',
                style: ThemeHelper.style28Bold(context).copyWith(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: AppColor.primary,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            height: 3,
            width: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF7B626),
                  Color(0xFF42AE59),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
