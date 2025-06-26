import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/theme_helper.dart';

/// Category view theme helper that provides consistent theming
/// for all category-related components with unified color system
class CategoryThemeHelper {
  const CategoryThemeHelper._();

  // ========== Theme Detection ==========

  /// Check if current theme is dark mode
  static bool isDark(BuildContext context) => ThemeHelper.isDark(context);

  // ========== Background Colors ==========

  /// Get main background color for category view
  static Color getBackgroundColor(BuildContext context) =>
      ThemeHelper.getNeutralBackgroundColor(context);

  /// Get category card background color
  static Color getCardBackgroundColor(BuildContext context) =>
      ThemeHelper.getElevatedCardColor(context);

  /// Get category card border color
  static Color getCardBorderColor(BuildContext context) =>
      ThemeHelper.getSubtleBorderColor(context);

  // ========== Text Colors ==========

  /// Get primary text color for category titles
  static Color getPrimaryTextColor(BuildContext context) =>
      ThemeHelper.primaryTextColor(context);

  /// Get secondary text color for category details
  static Color getSecondaryTextColor(BuildContext context) =>
      ThemeHelper.secondaryTextColor(context);

  /// Get category date text color
  static Color getDateTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF94A3B8), // Slate-400
        darkColor: const Color(0xFF64748B), // Slate-500
      );
  // ========== Icon Colors - Using Unified Colors ==========

  /// Get category icon color - using primary accent
  static Color getCategoryIconColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context);

  /// Get category icon background color
  static Color getCategoryIconBackgroundColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context).withAlpha(26);

  /// Get control panel icon color
  static Color getControlIconColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF64748B), // Slate-500
        darkColor: const Color(0xFF94A3B8), // Slate-400
      );

  // ========== Interactive Colors - Using Unified Colors ==========

  /// Get category card hover color
  static Color getCardHoverColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFFF1F5F9), // Slate-100
        darkColor: const Color(0xFF334155), // Slate-700
      );

  /// Get category card ripple color
  static Color getCardRippleColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context).withAlpha(26);

  // ========== Action Colors - Using Unified Colors ==========

  /// Get edit action color
  static Color getEditActionColor(BuildContext context) =>
      ThemeHelper.getInfoAccentColor(context); // Use info color for edit (blue)

  /// Get edit action background color
  static Color getEditActionBackgroundColor(BuildContext context) =>
      ThemeHelper.getInfoAccentColor(context).withAlpha(26);

  /// Get delete action color
  static Color getDeleteActionColor(BuildContext context) =>
      ThemeHelper.getQuaternaryAccentColor(
          context); // Use quaternary color for delete (red)

  /// Get delete action background color
  static Color getDeleteActionBackgroundColor(BuildContext context) =>
      ThemeHelper.getQuaternaryAccentColor(context).withAlpha(26);

  // ========== Shadows and Elevation ==========

  /// Get category card shadow
  static List<BoxShadow> getCardShadow(BuildContext context) => [
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withAlpha(13),
            darkColor: Colors.black.withAlpha(77),
          ),
          blurRadius: 12,
          offset: const Offset(0, 4),
          spreadRadius: -2,
        ),
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withAlpha(8),
            darkColor: Colors.black.withAlpha(51),
          ),
          blurRadius: 6,
          offset: const Offset(0, 2),
          spreadRadius: -1,
        ),
      ];

  /// Get floating action button shadow
  static List<BoxShadow> getFabShadow(BuildContext context) => [
        BoxShadow(
          color: AppColor.primary.withAlpha(77),
          blurRadius: 16,
          offset: const Offset(0, 8),
          spreadRadius: -4,
        ),
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withAlpha(13),
            darkColor: Colors.black.withAlpha(102),
          ),
          blurRadius: 8,
          offset: const Offset(0, 4),
          spreadRadius: -2,
        ),
      ];

  // ========== Decorations ==========

  /// Get category card decoration
  static BoxDecoration getCardDecoration(BuildContext context) => BoxDecoration(
        color: getCardBackgroundColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: getCardBorderColor(context),
          width: 1,
        ),
        boxShadow: getCardShadow(context),
      );

  /// Get category icon container decoration
  static BoxDecoration getIconContainerDecoration(BuildContext context) =>
      BoxDecoration(
        color: getCategoryIconBackgroundColor(context),
        borderRadius: BorderRadius.circular(12),
      );

  /// Get edit action button decoration
  static BoxDecoration getEditButtonDecoration(BuildContext context) =>
      BoxDecoration(
        color: getEditActionBackgroundColor(context),
        borderRadius: BorderRadius.circular(8),
      );

  /// Get delete action button decoration
  static BoxDecoration getDeleteButtonDecoration(BuildContext context) =>
      BoxDecoration(
        color: getDeleteActionBackgroundColor(context),
        borderRadius: BorderRadius.circular(8),
      );

  // ========== Text Styles ==========

  /// Get category title text style
  static TextStyle getCategoryTitleStyle(BuildContext context) =>
      ThemeHelper.style18Bold(context).copyWith(
        color: getPrimaryTextColor(context),
        fontWeight: FontWeight.w600,
        letterSpacing: -0.02,
      );

  /// Get category date text style
  static TextStyle getCategoryDateStyle(BuildContext context) =>
      ThemeHelper.style14Regular(context).copyWith(
        color: getDateTextColor(context),
        fontWeight: FontWeight.w400,
      );

  /// Get action button text style
  static TextStyle getActionButtonTextStyle(BuildContext context) =>
      ThemeHelper.style12Bold(context).copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.02,
      );

  // ========== Dimensions ==========

  /// Card dimensions and spacing
  static const double cardBorderRadius = 16.0;
  static const double cardPadding = 20.0;
  static const double cardMargin = 12.0;
  static const double cardElevation = 2.0;

  /// Icon dimensions
  static const double categoryIconSize = 28.0;
  static const double categoryIconContainerSize = 56.0;
  static const double actionIconSize = 20.0;

  /// Spacing values
  static const double sectionSpacing = 16.0;
  static const double itemSpacing = 12.0;
  static const double controlPanelSpacing = 24.0;
  static const double actionButtonSpacing = 8.0;

  /// Button dimensions
  static const double actionButtonHeight = 36.0;
  static const double actionButtonMinWidth = 80.0;
  static const double actionButtonBorderRadius = 8.0;

  // ========== Animations ==========

  /// Card animation duration
  static const Duration cardAnimationDuration = Duration(milliseconds: 200);

  /// Hover animation duration
  static const Duration hoverAnimationDuration = Duration(milliseconds: 150);

  /// FAB animation duration
  static const Duration fabAnimationDuration = Duration(milliseconds: 200);

  /// Action animation duration
  static const Duration actionAnimationDuration = Duration(milliseconds: 250);

  // ========== Animation Curves ==========

  /// Card animation curve
  static const Curve cardAnimationCurve = Curves.easeInOut;

  /// Hover animation curve
  static const Curve hoverAnimationCurve = Curves.easeOut;

  /// FAB animation curve
  static const Curve fabAnimationCurve = Curves.elasticOut;

  // ========== Helper Methods ==========

  /// Get adaptive color with fallback
  static Color getAdaptiveColorWithFallback(
    BuildContext context, {
    required Color lightColor,
    required Color darkColor,
    Color? fallback,
  }) {
    try {
      return ThemeHelper.getAdaptiveColor(
        context,
        lightColor: lightColor,
        darkColor: darkColor,
      );
    } catch (e) {
      return fallback ?? lightColor;
    }
  }

  /// Get category status color based on category state
  static Color getCategoryStatusColor(BuildContext context, String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return ThemeHelper.getTertiaryAccentColor(context); // Green
      case 'inactive':
        return ThemeHelper.getWarningAccentColor(context); // Orange
      case 'archived':
        return getSecondaryTextColor(context);
      default:
        return getCategoryIconColor(context);
    }
  }

  /// Get gradient colors for category headers
  static List<Color> getHeaderGradientColors(BuildContext context) => [
        ThemeHelper.getPrimaryAccentColor(context).withAlpha(13),
        ThemeHelper.getPrimaryAccentColor(context).withAlpha(8),
      ];
}
