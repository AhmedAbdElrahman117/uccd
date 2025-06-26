import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';

/// Enum for different admin menu button types with enhanced styling
enum AdminMenuButtonType {
  statistics,
  interview,
  edit,
  changeInstructor,
  changeCategory,
  delete,
  ratings,
  students,
}

/// Theme helper for admin menu buttons with enhanced UI design and unified colors
class AdminMenuThemeHelper {
  /// Animation duration for button interactions
  static const Duration animationDuration = Duration(milliseconds: 300);

  /// Hover animation duration
  static const Duration hoverDuration = Duration(milliseconds: 200);

  /// Button border radius
  static const double borderRadius = 16.0;

  /// Button elevation
  static const double elevation = 8.0;

  /// Hover elevation
  static const double hoverElevation = 12.0;

  /// Icon size
  static const double iconSize = 24.0;

  /// Get the primary color for a button type using unified color system
  static Color getPrimaryColor(BuildContext context, AdminMenuButtonType type) {
    switch (type) {
      case AdminMenuButtonType.statistics:
        return ThemeHelper.getInfoAccentColor(context); // Blue
      case AdminMenuButtonType.interview:
        return ThemeHelper.getTertiaryAccentColor(context); // Green
      case AdminMenuButtonType.edit:
        return ThemeHelper.getWarningAccentColor(context); // Orange
      case AdminMenuButtonType.changeInstructor:
        return ThemeHelper.getSecondaryAccentColor(context); // Purple
      case AdminMenuButtonType.changeCategory:
        return ThemeHelper.getPrimaryAccentColor(
            context); // Primary (AppColor.primary)
      case AdminMenuButtonType.delete:
        return ThemeHelper.getQuaternaryAccentColor(context); // Red
      case AdminMenuButtonType.ratings:
        return ThemeHelper.getWarningAccentColor(context); // Orange/Yellow
      case AdminMenuButtonType.students:
        return ThemeHelper.getInfoAccentColor(context); // Blue
    }
  }

  /// Get the secondary color (lighter variant) for a button type
  static Color getSecondaryColor(
      BuildContext context, AdminMenuButtonType type) {
    switch (type) {
      case AdminMenuButtonType.statistics:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFEBF8FF), // Light blue background
          darkColor: const Color(0xFF1E3A8A), // Dark blue background
        );
      case AdminMenuButtonType.interview:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFECFDF5), // Light green background
          darkColor: const Color(0xFF14532D), // Dark green background
        );
      case AdminMenuButtonType.edit:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFFF7ED), // Light orange background
          darkColor: const Color(0xFF9A3412), // Dark orange background
        );
      case AdminMenuButtonType.changeInstructor:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFAF5FF), // Light purple background
          darkColor: const Color(0xFF581C87), // Dark purple background
        );
      case AdminMenuButtonType.changeCategory:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFEFCE8), // Light yellow background
          darkColor: const Color(0xFF92400E), // Dark yellow background
        );
      case AdminMenuButtonType.delete:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFEF2F2), // Light red background
          darkColor: const Color(0xFF991B1B), // Dark red background
        );
      case AdminMenuButtonType.ratings:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFEFBEA), // Light amber background
          darkColor: const Color(0xFF78350F), // Dark amber background
        );
      case AdminMenuButtonType.students:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFF0F9FF), // Light sky background
          darkColor: const Color(0xFF0C4A6E), // Dark sky background
        );
    }
  }

  /// Get the hover color for a button type
  static Color getHoverColor(BuildContext context, AdminMenuButtonType type) {
    switch (type) {
      case AdminMenuButtonType.statistics:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFDBEAFE), // Darker blue hover
          darkColor: const Color(0xFF1D4ED8), // Lighter blue hover
        );
      case AdminMenuButtonType.interview:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFD1FAE5), // Darker green hover
          darkColor: const Color(0xFF16A34A), // Lighter green hover
        );
      case AdminMenuButtonType.edit:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFED7AA), // Darker orange hover
          darkColor: const Color(0xFFEA580C), // Lighter orange hover
        );
      case AdminMenuButtonType.changeInstructor:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFE9D5FF), // Darker purple hover
          darkColor: const Color(0xFF9333EA), // Lighter purple hover
        );
      case AdminMenuButtonType.changeCategory:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFEF3C7), // Darker yellow hover
          darkColor: const Color(0xFFD97706), // Lighter yellow hover
        );
      case AdminMenuButtonType.delete:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFECACA), // Darker red hover
          darkColor: const Color(0xFFDC2626), // Lighter red hover
        );
      case AdminMenuButtonType.ratings:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFDE68A), // Darker amber hover
          darkColor: const Color(0xFFF59E0B), // Lighter amber hover
        );
      case AdminMenuButtonType.students:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFE0F2FE), // Darker sky hover
          darkColor: const Color(0xFF0284C7), // Lighter sky hover
        );
    }
  }

  /// Get the pressed color for a button type
  static Color getPressedColor(BuildContext context, AdminMenuButtonType type) {
    switch (type) {
      case AdminMenuButtonType.statistics:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFBFDBFE), // Even darker blue pressed
          darkColor: const Color(0xFF2563EB), // Even lighter blue pressed
        );
      case AdminMenuButtonType.interview:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFA7F3D0), // Even darker green pressed
          darkColor: const Color(0xFF22C55E), // Even lighter green pressed
        );
      case AdminMenuButtonType.edit:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFDBA74), // Even darker orange pressed
          darkColor: const Color(0xFFF97316), // Even lighter orange pressed
        );
      case AdminMenuButtonType.changeInstructor:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFDDD6FE), // Even darker purple pressed
          darkColor: const Color(0xFFA855F7), // Even lighter purple pressed
        );
      case AdminMenuButtonType.changeCategory:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFDE047), // Even darker yellow pressed
          darkColor: const Color(0xFFEAB308), // Even lighter yellow pressed
        );
      case AdminMenuButtonType.delete:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFCA5A5), // Even darker red pressed
          darkColor: const Color(0xFFEF4444), // Even lighter red pressed
        );
      case AdminMenuButtonType.ratings:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFFCD34D), // Even darker amber pressed
          darkColor: const Color(0xFFFBBF24), // Even lighter amber pressed
        );
      case AdminMenuButtonType.students:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFFBAE6FD), // Even darker sky pressed
          darkColor: const Color(0xFF0EA5E9), // Even lighter sky pressed
        );
    }
  }

  /// Get the text color for a button type
  static Color getTextColor(BuildContext context, AdminMenuButtonType type,
      {bool isHovered = false}) {
    if (isHovered) {
      return getPrimaryColor(context, type);
    }
    return ThemeHelper.getAdaptiveColor(
      context,
      lightColor: const Color(0xFF64748B), // Slate-500
      darkColor: const Color(0xFF94A3B8), // Slate-400
    );
  }

  /// Get the icon color for a button type
  static Color getIconColor(BuildContext context, AdminMenuButtonType type,
      {bool isHovered = false}) {
    if (isHovered) {
      return Colors.white;
    }
    return getPrimaryColor(context, type);
  }

  /// Get the icon background color for a button type
  static Color getIconBackgroundColor(
      BuildContext context, AdminMenuButtonType type,
      {bool isHovered = false}) {
    if (isHovered) {
      return Colors.white.withValues(alpha: 0.9);
    }

    switch (type) {
      case AdminMenuButtonType.statistics:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.white,
          darkColor: const Color(0xFF1E40AF),
        );
      case AdminMenuButtonType.interview:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.white,
          darkColor: const Color(0xFF047857),
        );
      case AdminMenuButtonType.edit:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.white,
          darkColor: const Color(0xFFDC2626),
        );
      case AdminMenuButtonType.changeInstructor:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.white,
          darkColor: const Color(0xFF7C2D12),
        );
      case AdminMenuButtonType.changeCategory:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.white,
          darkColor: const Color(0xFF92400E),
        );
      case AdminMenuButtonType.delete:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.white,
          darkColor: const Color(0xFF991B1B),
        );
      case AdminMenuButtonType.ratings:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.white,
          darkColor: const Color(0xFF78350F),
        );
      case AdminMenuButtonType.students:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.white,
          darkColor: const Color(0xFF0C4A6E),
        );
    }
  }

  /// Get gradient colors for enhanced visual effects
  static List<Color> getGradientColors(
      BuildContext context, AdminMenuButtonType type) {
    switch (type) {
      case AdminMenuButtonType.statistics:
        return [
          getSecondaryColor(context, type),
          getHoverColor(context, type),
          Colors.transparent,
        ];
      case AdminMenuButtonType.interview:
        return [
          getSecondaryColor(context, type),
          getHoverColor(context, type),
          Colors.transparent,
        ];
      case AdminMenuButtonType.edit:
        return [
          getSecondaryColor(context, type),
          getHoverColor(context, type),
          Colors.transparent,
        ];
      case AdminMenuButtonType.changeInstructor:
        return [
          getSecondaryColor(context, type),
          getHoverColor(context, type),
          Colors.transparent,
        ];
      case AdminMenuButtonType.changeCategory:
        return [
          getSecondaryColor(context, type),
          getHoverColor(context, type),
          Colors.transparent,
        ];
      case AdminMenuButtonType.delete:
        return [
          getSecondaryColor(context, type),
          getHoverColor(context, type),
          Colors.transparent,
        ];
      case AdminMenuButtonType.ratings:
        return [
          getSecondaryColor(context, type),
          getHoverColor(context, type),
          Colors.transparent,
        ];
      case AdminMenuButtonType.students:
        return [
          getSecondaryColor(context, type),
          getHoverColor(context, type),
          Colors.transparent,
        ];
    }
  }

  /// Get the shadow color for a button type
  static Color getShadowColor(BuildContext context, AdminMenuButtonType type) {
    switch (type) {
      case AdminMenuButtonType.statistics:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor:
              const Color(0xFF3B82F6).withValues(alpha: 0.3), // Blue shadow
          darkColor: const Color(0xFF1D4ED8)
              .withValues(alpha: 0.5), // Darker blue shadow
        );
      case AdminMenuButtonType.interview:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor: const Color(0xFF10B981).withValues(
            alpha: 0.3,
          ), // Green shadow
          darkColor: const Color(0xFF059669)
              .withValues(alpha: 0.5), // Darker green shadow
        );
      case AdminMenuButtonType.edit:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor:
              const Color(0xFFF97316).withValues(alpha: 0.3), // Orange shadow
          darkColor: const Color(0xFFEA580C)
              .withValues(alpha: 0.5), // Darker orange shadow
        );
      case AdminMenuButtonType.changeInstructor:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor:
              const Color(0xFF8B5CF6).withValues(alpha: 0.3), // Purple shadow
          darkColor: const Color(0xFF7C3AED)
              .withValues(alpha: 0.5), // Darker purple shadow
        );
      case AdminMenuButtonType.changeCategory:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor:
              const Color(0xFFF59E0B).withValues(alpha: 0.3), // Yellow shadow
          darkColor: const Color(0xFFD97706)
              .withValues(alpha: 0.5), // Darker yellow shadow
        );
      case AdminMenuButtonType.delete:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor:
              const Color(0xFFEF4444).withValues(alpha: 0.3), // Red shadow
          darkColor: const Color(0xFFDC2626)
              .withValues(alpha: 0.5), // Darker red shadow
        );
      case AdminMenuButtonType.ratings:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor:
              const Color(0xFFF59E0B).withValues(alpha: 0.3), // Amber shadow
          darkColor: const Color(0xFFD97706)
              .withValues(alpha: 0.5), // Darker amber shadow
        );
      case AdminMenuButtonType.students:
        return ThemeHelper.getAdaptiveColor(
          context,
          lightColor:
              const Color(0xFF0EA5E9).withValues(alpha: 0.3), // Sky shadow
          darkColor: const Color(0xFF0284C7)
              .withValues(alpha: 0.5), // Darker sky shadow
        );
    }
  }

  /// Get button decoration for enhanced styling
  static BoxDecoration getButtonDecoration(
    BuildContext context,
    AdminMenuButtonType type, {
    bool isHovered = false,
    bool isPressed = false,
  }) {
    Color backgroundColor;
    if (isPressed) {
      backgroundColor = getPressedColor(context, type);
    } else if (isHovered) {
      backgroundColor = getHoverColor(context, type);
    } else {
      backgroundColor = getSecondaryColor(context, type);
    }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: isHovered ? getPrimaryColor(context, type) : Colors.transparent,
        width: isHovered ? 2.0 : 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: getShadowColor(context, type),
          blurRadius: isHovered ? hoverElevation : elevation,
          offset: Offset(0, isHovered ? 6 : 4),
          spreadRadius: 0,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: getGradientColors(context, type),
        stops: const [0.0, 0.5, 1.0],
      ),
    );
  }

  /// Get text style for button title
  static TextStyle getTitleTextStyle(
    BuildContext context,
    AdminMenuButtonType type, {
    bool isHovered = false,
  }) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: getTextColor(context, type, isHovered: isHovered),
      letterSpacing: 0.5,
    );
  }

  /// Get text style for button subtitle
  static TextStyle getSubtitleTextStyle(
    BuildContext context,
    AdminMenuButtonType type, {
    bool isHovered = false,
  }) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF64748B), // Slate-500
        darkColor: const Color(0xFF94A3B8), // Slate-400
      ),
      letterSpacing: 0.3,
    );
  }
}
