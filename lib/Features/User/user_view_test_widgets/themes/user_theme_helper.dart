import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';

class UserThemeHelper {
  static Color getCardBackgroundColor(BuildContext context) {
    return ThemeHelper.getElevatedCardColor(context);
  }

  static Color getCardBorderColor(BuildContext context) {
    return ThemeHelper.getSubtleBorderColor(context);
  }

  static Color getPageBackgroundColor(BuildContext context) {
    return ThemeHelper.getNeutralBackgroundColor(context);
  }

  static Color getWelcomeGradientStartColor(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode
        ? const Color(0xFF1E293B) // Slate-800
        : const Color(0xFFE2E8F0); // Slate-200
  }

  static Color getWelcomeGradientEndColor(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode
        ? const Color(0xFF0F172A) // Slate-900
        : const Color(0xFFF8FAFC); // Slate-50
  }

  static List<Color> getWelcomeGradientColors(BuildContext context) {
    return [
      getWelcomeGradientStartColor(context),
      getWelcomeGradientEndColor(context),
    ];
  }

  static Color getPrimaryStatColor(BuildContext context) {
    return ThemeHelper.getInfoAccentColor(context);
  }

  static Color getSecondaryStatColor(BuildContext context) {
    return ThemeHelper.getPrimaryAccentColor(context);
  }

  static Color getProgressColor(BuildContext context) {
    return ThemeHelper.getTertiaryAccentColor(context);
  }

  static Color getCompletedColor(BuildContext context) {
    return ThemeHelper.getTertiaryAccentColor(context);
  }

  static Color getEnrolledColor(BuildContext context) {
    return ThemeHelper.getInfoAccentColor(context);
  }

  static Color getInProgressColor(BuildContext context) {
    return ThemeHelper.getWarningAccentColor(context);
  }

  static Color getSecondaryTextColor(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode
        ? const Color(0xFF94A3B8) // Slate-400
        : const Color(0xFF64748B); // Slate-500
  }

  static Color getHintTextColor(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode
        ? const Color(0xFF64748B) // Slate-500
        : const Color(0xFF94A3B8); // Slate-400
  }

  static BoxDecoration getCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: getCardBackgroundColor(context),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: getCardBorderColor(context),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black.withValues(alpha: 0.2)
              : Colors.black.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  static BoxDecoration getWelcomeDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: getWelcomeGradientColors(context),
      ),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black.withValues(alpha: 0.3)
              : Colors.black.withValues(alpha: 0.1),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  static TextStyle getPrimaryTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle getSecondaryTextStyle(BuildContext context) {
    return TextStyle(
      color: getSecondaryTextColor(context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle getHintTextStyle(BuildContext context) {
    return TextStyle(
      color: getHintTextColor(context),
      fontWeight: FontWeight.w300,
    );
  }

  static Color getEmptyStateColor(BuildContext context) {
    return getSecondaryTextColor(context);
  }

  static Color getDividerColor(BuildContext context) {
    return getCardBorderColor(context);
  }
}
