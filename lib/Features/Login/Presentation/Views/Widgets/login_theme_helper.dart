import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';

/// Login-specific theme helper that extends the central ThemeHelper
/// for login screen specific theming needs with unified color system
class LoginThemeHelper {
  // Use central theme detection
  static bool isDark(BuildContext context) => ThemeHelper.isDark(context);
  // Unified login background gradient colors using AppColor
  static Color getBackgroundGradientStart(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: ThemeHelper.getPrimaryAccentColor(context)
            .withAlpha(26), // Very light primary color
        darkColor: const Color(0xFF0F172A), // Slate-900
      );

  static Color getBackgroundGradientMiddle(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: Colors.white,
        darkColor: const Color(0xFF1E293B), // Slate-800
      );

  static Color getBackgroundGradientEnd(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: ThemeHelper.getSecondaryAccentColor(context)
            .withAlpha(26), // Very light secondary color
        darkColor: const Color(0xFF334155), // Slate-700
      );
  // Use central card styling with unified colors
  static Color getCardColor(BuildContext context) =>
      ThemeHelper.getElevatedCardColor(context);

  static Border? getCardBorder(BuildContext context) => isDark(context)
      ? Border.all(color: ThemeHelper.getSubtleBorderColor(context), width: 1)
      : null;

  static List<BoxShadow> getCardShadows(BuildContext context) => [
        BoxShadow(
          color: ThemeHelper.shadowColor(context),
          blurRadius: 30,
          offset: const Offset(0, 15),
        ),
        BoxShadow(
          color: ThemeHelper.shadowColor(context).withAlpha(25),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ];

  static Color getWelcomeTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF64748B), // Slate-500
        darkColor: const Color(0xFF94A3B8), // Slate-400
      );

  static Color getForgotPasswordTextColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context);

  static Color getDividerColor(BuildContext context) =>
      ThemeHelper.getSubtleBorderColor(context);

  static Color getOrTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF64748B), // Slate-500
        darkColor: const Color(0xFF94A3B8), // Slate-400
      );

  static Color getSupportButtonIconColor(BuildContext context) =>
      ThemeHelper.getSecondaryAccentColor(context);

  static Color getSupportButtonTextColor(BuildContext context) =>
      ThemeHelper.getSecondaryAccentColor(context);

  static BorderSide getSupportButtonBorder(BuildContext context) => BorderSide(
        color: ThemeHelper.getSubtleBorderColor(context),
      );

  static Color getFooterPrimaryTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF64748B), // Slate-500
        darkColor: const Color(0xFF94A3B8), // Slate-400
      );

  static Color getFooterSecondaryTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF94A3B8), // Slate-400
        darkColor: const Color(0xFF64748B), // Slate-500
      );

  static Color getLogoBackgroundColor(BuildContext context) =>
      ThemeHelper.getElevatedCardColor(context);

  static Border? getLogoBorder(BuildContext context) => isDark(context)
      ? Border.all(color: ThemeHelper.getSubtleBorderColor(context), width: 1)
      : null;

  static List<BoxShadow> getLogoShadows(BuildContext context) => [
        BoxShadow(
          color: ThemeHelper.shadowColor(context),
          blurRadius: 30,
          offset: const Offset(0, 15),
        ),
        BoxShadow(
          color: ThemeHelper.getPrimaryAccentColor(context).withAlpha(51),
          blurRadius: 20,
          offset: const Offset(0, 5),
        ),
      ];
}
