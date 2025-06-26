import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

/// Comprehensive theme helper that provides easy access to theme-related
/// properties and utilities across the entire application.
///
/// This helper centralizes theme management and provides:
/// - Easy theme detection (light/dark)
/// - Context-aware color access
/// - Text style utilities
/// - Common theme patterns
/// - Spacing and sizing helpers
/// - Unified color system based on AppColor
///
/// ## Unified Color System
/// All accent colors are derived from AppColor constants:
/// - Primary Accent: AppColor.primary (Golden Yellow #F7B626)
/// - Secondary Accent: AppColor.secondry/secondryDark (Green variants)
/// - Tertiary Accent: AppColor.secondryGradient[1] (Success Green)
/// - Quaternary Accent: AppColor.thirdColor (Red #CC3027)
/// - Warning Accent: Blend of AppColor.primary and orange
/// - Info Accent: AppColor.secondryGradient[0] (Blue)
///
/// This ensures brand consistency across all feature modules.
class ThemeHelper {
  const ThemeHelper._();

  // ========== Theme Detection ==========

  /// Returns true if the current theme is dark mode
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  /// Returns true if the current theme is light mode
  static bool isLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;

  /// Returns the current brightness
  static Brightness getBrightness(BuildContext context) =>
      Theme.of(context).brightness;

  // ========== Color Helpers ==========

  /// Get primary color from theme
  static Color primaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  /// Get secondary color from theme
  static Color secondaryColor(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;

  /// Get surface color from theme
  static Color surfaceColor(BuildContext context) =>
      Theme.of(context).colorScheme.surface;

  /// Get background color from theme
  static Color backgroundColor(BuildContext context) =>
      Theme.of(context).colorScheme.surface;

  /// Get scaffold background color
  static Color scaffoldBackgroundColor(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  /// Get card color
  static Color cardColor(BuildContext context) =>
      isDark(context) ? const Color(0xFF252525) : Colors.white;

  /// Get primary text color based on theme
  static Color primaryTextColor(BuildContext context) =>
      isDark(context) ? Colors.white : Colors.black;

  /// Get secondary text color based on theme
  static Color secondaryTextColor(BuildContext context) =>
      isDark(context) ? Colors.white70 : Colors.black54;

  /// Get hint text color based on theme
  static Color hintTextColor(BuildContext context) =>
      isDark(context) ? Colors.white38 : Colors.black38;

  /// Get divider color based on theme
  static Color dividerColor(BuildContext context) =>
      isDark(context) ? Colors.white24 : Colors.black12;

  /// Get icon color based on theme
  static Color iconColor(BuildContext context) =>
      isDark(context) ? Colors.white : Colors.black;

  /// Get shadow color based on theme
  static Color shadowColor(BuildContext context) => isDark(context)
      ? Colors.white.withValues(alpha: 0.1)
      : Colors.black.withValues(alpha: 0.1);

  /// Get border color based on theme
  static Color borderColor(BuildContext context) =>
      isDark(context) ? Colors.white24 : Colors.black12;

  /// Apply secondary color from AppColor with theme consideration
  static Color applySecondaryColor(BuildContext context) =>
      AppColor.applySecondary(context);

  // ========== App-specific Colors ==========

  /// Get app primary color (always returns the brand color)
  static Color get appPrimaryColor => AppColor.primary;

  /// Get app secondary color
  static Color get appSecondaryColor => AppColor.secondry;

  /// Get app secondary dark color
  static Color get appSecondaryDarkColor => AppColor.secondryDark;

  /// Get app third color
  static Color get appThirdColor => AppColor.thirdColor;

  /// Get app secondary gradient colors
  static List<Color> get appSecondaryGradient => AppColor.secondryGradient;
  // ========== Unified Accent Color System Using AppColor ==========

  /// Get primary accent color - Using AppColor.primary as base
  static Color getPrimaryAccentColor(BuildContext context) => getAdaptiveColor(
        context,
        lightColor: AppColor.primary, // Use app primary color for consistency
        darkColor: AppColor.primary
            .withValues(alpha: 0.9), // Slightly transparent for dark mode
      );

  /// Get secondary accent color - Using AppColor.secondry
  static Color getSecondaryAccentColor(BuildContext context) =>
      getAdaptiveColor(
        context,
        lightColor: AppColor.secondry, // Use app secondary color
        darkColor: AppColor.secondryDark, // Use app secondary dark variant
      );

  /// Get tertiary accent color - Success Green (based on secondary gradient)
  static Color getTertiaryAccentColor(BuildContext context) => getAdaptiveColor(
        context,
        lightColor: AppColor.secondryGradient[1], // Green from gradient
        darkColor: AppColor.secondryGradient[2], // Lighter green for dark mode
      );

  /// Get quaternary accent color - Using AppColor.thirdColor (Red)
  static Color getQuaternaryAccentColor(BuildContext context) =>
      getAdaptiveColor(
        context,
        lightColor: AppColor.thirdColor, // Use app third color (red)
        darkColor: AppColor.thirdColor
            .withValues(alpha: 0.8), // Softer red for dark mode
      );

  /// Get warning accent color - Derived from primary
  static Color getWarningAccentColor(BuildContext context) => getAdaptiveColor(
        context,
        lightColor: Color.lerp(
            AppColor.primary, Colors.orange, 0.3)!, // Blend primary with orange
        darkColor: Color.lerp(
            AppColor.primary, Colors.orange, 0.5)!, // More orange for dark mode
      );

  /// Get info accent color - Using secondary gradient blue
  static Color getInfoAccentColor(BuildContext context) => getAdaptiveColor(
        context,
        lightColor: AppColor.secondryGradient[0], // Blue from gradient
        darkColor: AppColor.secondryGradient[0]
            .withValues(alpha: 0.8), // Softer blue for dark mode
      );

  // ========== Unified Background Colors ==========

  /// Get neutral background color
  static Color getNeutralBackgroundColor(BuildContext context) =>
      getAdaptiveColor(
        context,
        lightColor: const Color(0xFFF8FAFC), // Slate-50
        darkColor: const Color(0xFF0F172A), // Slate-900
      );

  /// Get card background with proper elevation
  static Color getElevatedCardColor(BuildContext context) => getAdaptiveColor(
        context,
        lightColor: Colors.white,
        darkColor: const Color(0xFF1E293B), // Slate-800
      );

  /// Get subtle border color
  static Color getSubtleBorderColor(BuildContext context) => getAdaptiveColor(
        context,
        lightColor: const Color(0xFFE2E8F0), // Slate-200
        darkColor: const Color(0xFF334155), // Slate-700
      );

  // ========== Text Style Helpers ==========

  /// Get headline text style from theme
  static TextStyle headlineStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: primaryTextColor(context),
          ) ??
      TextStyle(color: primaryTextColor(context));

  /// Get title text style from theme
  static TextStyle titleStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge?.copyWith(
            color: primaryTextColor(context),
          ) ??
      TextStyle(color: primaryTextColor(context));

  /// Get subtitle text style from theme
  static TextStyle subtitleStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium?.copyWith(
            color: secondaryTextColor(context),
          ) ??
      TextStyle(color: secondaryTextColor(context));

  /// Get body text style from theme
  static TextStyle bodyStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: primaryTextColor(context),
          ) ??
      TextStyle(color: primaryTextColor(context));

  /// Get caption text style from theme
  static TextStyle captionStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall?.copyWith(
            color: secondaryTextColor(context),
          ) ??
      TextStyle(color: secondaryTextColor(context));

  // ========== App Text Style Shortcuts ==========

  /// Quick access to app text styles with context
  static TextStyle style12Regular(BuildContext context) =>
      AppText.style12Regular(context);

  static TextStyle style12Bold(BuildContext context) =>
      AppText.style12Bold(context);

  static TextStyle style14Regular(BuildContext context) =>
      AppText.style14Regular(context);

  static TextStyle style14Bold(BuildContext context) =>
      AppText.style14Bold(context);

  static TextStyle style16Regular(BuildContext context) =>
      AppText.style16Regular(context);

  static TextStyle style16Bold(BuildContext context) =>
      AppText.style16Bold(context);

  static TextStyle style17Bold(BuildContext context) =>
      AppText.style17Bold(context);

  static TextStyle style18Regular(BuildContext context) =>
      AppText.style18Regular(context);

  static TextStyle style18Bold(BuildContext context) =>
      AppText.style18Bold(context);

  static TextStyle style20Bold(BuildContext context) =>
      AppText.style20Bold(context);

  static TextStyle style22Bold(BuildContext context) =>
      AppText.style22Bold(context);
  static TextStyle style23Bold(BuildContext context) =>
      AppText.style23Bold(context);

  static TextStyle style24Bold(BuildContext context) =>
      AppText.style24Bold(context);

  static TextStyle style28Bold(BuildContext context) =>
      AppText.style28Bold(context);

  // ========== Spacing Helpers ==========

  /// Standard padding values
  static const EdgeInsets paddingAll4 = EdgeInsets.all(4);
  static const EdgeInsets paddingAll8 = EdgeInsets.all(8);
  static const EdgeInsets paddingAll12 = EdgeInsets.all(12);
  static const EdgeInsets paddingAll16 = EdgeInsets.all(16);
  static const EdgeInsets paddingAll20 = EdgeInsets.all(20);
  static const EdgeInsets paddingAll24 = EdgeInsets.all(24);
  static const EdgeInsets paddingAll32 = EdgeInsets.all(32);

  /// Standard horizontal padding
  static const EdgeInsets paddingH8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets paddingH12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets paddingH16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets paddingH20 = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets paddingH24 = EdgeInsets.symmetric(horizontal: 24);

  /// Standard vertical padding
  static const EdgeInsets paddingV8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets paddingV12 = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets paddingV16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets paddingV20 = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsets paddingV24 = EdgeInsets.symmetric(vertical: 24);

  /// Standard gaps
  static const SizedBox gap4 = SizedBox(height: 4, width: 4);
  static const SizedBox gap8 = SizedBox(height: 8, width: 8);
  static const SizedBox gap12 = SizedBox(height: 12, width: 12);
  static const SizedBox gap16 = SizedBox(height: 16, width: 16);
  static const SizedBox gap20 = SizedBox(height: 20, width: 20);
  static const SizedBox gap24 = SizedBox(height: 24, width: 24);
  static const SizedBox gap32 = SizedBox(height: 32, width: 32);

  /// Vertical gaps
  static const SizedBox gapV4 = SizedBox(height: 4);
  static const SizedBox gapV8 = SizedBox(height: 8);
  static const SizedBox gapV12 = SizedBox(height: 12);
  static const SizedBox gapV16 = SizedBox(height: 16);
  static const SizedBox gapV20 = SizedBox(height: 20);
  static const SizedBox gapV24 = SizedBox(height: 24);
  static const SizedBox gapV32 = SizedBox(height: 32);

  /// Horizontal gaps
  static const SizedBox gapH4 = SizedBox(width: 4);
  static const SizedBox gapH8 = SizedBox(width: 8);
  static const SizedBox gapH12 = SizedBox(width: 12);
  static const SizedBox gapH16 = SizedBox(width: 16);
  static const SizedBox gapH20 = SizedBox(width: 20);
  static const SizedBox gapH24 = SizedBox(width: 24);
  static const SizedBox gapH32 = SizedBox(width: 32);

  // ========== Border Radius Helpers ==========

  /// Standard border radius values
  static const Radius radius4 = Radius.circular(4);
  static const Radius radius8 = Radius.circular(8);
  static const Radius radius12 = Radius.circular(12);
  static const Radius radius16 = Radius.circular(16);
  static const Radius radius20 = Radius.circular(20);
  static const Radius radius24 = Radius.circular(24);

  /// Standard border radius
  static const BorderRadius borderRadius4 = BorderRadius.all(radius4);
  static const BorderRadius borderRadius8 = BorderRadius.all(radius8);
  static const BorderRadius borderRadius12 = BorderRadius.all(radius12);
  static const BorderRadius borderRadius16 = BorderRadius.all(radius16);
  static const BorderRadius borderRadius20 = BorderRadius.all(radius20);
  static const BorderRadius borderRadius24 = BorderRadius.all(radius24);

  // ========== Elevation Helpers ==========

  /// Standard elevation values
  static const double elevation1 = 1;
  static const double elevation2 = 2;
  static const double elevation4 = 4;
  static const double elevation6 = 6;
  static const double elevation8 = 8;
  static const double elevation12 = 12;
  static const double elevation16 = 16;
  static const double elevation24 = 24;

  // ========== Utility Methods ==========

  /// Get theme-aware box decoration
  static BoxDecoration getCardDecoration(
    BuildContext context, {
    double? borderRadius,
    Color? color,
    double? elevation,
  }) {
    return BoxDecoration(
      color: color ?? cardColor(context),
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      boxShadow: elevation != null
          ? [
              BoxShadow(
                color: shadowColor(context),
                blurRadius: elevation,
                offset: Offset(0, elevation / 2),
              ),
            ]
          : null,
    );
  }

  /// Get theme-aware container decoration
  static BoxDecoration getContainerDecoration(
    BuildContext context, {
    double? borderRadius,
    Color? color,
    Color? borderColor,
    double? borderWidth,
  }) {
    return BoxDecoration(
      color: color ?? surfaceColor(context),
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      border: borderColor != null
          ? Border.all(color: borderColor, width: borderWidth ?? 1)
          : Border.all(color: ThemeHelper.borderColor(context)),
    );
  }

  /// Get theme-aware input decoration
  static InputDecoration getInputDecoration(
    BuildContext context, {
    String? hintText,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double? borderRadius,
  }) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hintStyle: style14Regular(context).copyWith(
        color: hintTextColor(context),
      ),
      labelStyle: style14Bold(context).copyWith(
        color: secondaryTextColor(context),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        borderSide: BorderSide(color: borderColor(context)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        borderSide: BorderSide(color: borderColor(context)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        borderSide: BorderSide(color: appPrimaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }

  /// Get gradient colors for backgrounds based on theme
  static List<Color> getBackgroundGradient(
    BuildContext context, {
    List<Color>? lightColors,
    List<Color>? darkColors,
  }) {
    if (isDark(context)) {
      return darkColors ??
          [
            const Color(0xFF1A1A2E),
            const Color(0xFF16213E),
            const Color(0xFF0F3460),
            appPrimaryColor.withValues(alpha: 0.3),
          ];
    } else {
      return lightColors ??
          [
            Colors.white,
            appPrimaryColor.withValues(alpha: 0.1),
            appPrimaryColor.withValues(alpha: 0.2),
            appPrimaryColor.withValues(alpha: 0.3),
          ];
    }
  }

  /// Get theme-aware button style
  static ButtonStyle getElevatedButtonStyle(
    BuildContext context, {
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
    EdgeInsets? padding,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? appPrimaryColor,
      foregroundColor: foregroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      padding: padding ?? paddingV16,
      elevation: elevation4,
      shadowColor: shadowColor(context),
    );
  }

  /// Get theme-aware outlined button style
  static ButtonStyle getOutlinedButtonStyle(
    BuildContext context, {
    Color? foregroundColor,
    Color? borderColor,
    double? borderRadius,
    EdgeInsets? padding,
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: foregroundColor ?? primaryTextColor(context),
      side: BorderSide(
        color: borderColor ?? ThemeHelper.borderColor(context),
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      padding: padding ?? paddingV16,
    );
  }

  /// Get theme-aware text button style
  static ButtonStyle getTextButtonStyle(
    BuildContext context, {
    Color? foregroundColor,
    EdgeInsets? padding,
  }) {
    return TextButton.styleFrom(
      foregroundColor: foregroundColor ?? appPrimaryColor,
      padding: padding ?? paddingV12,
    );
  }

  /// Get adaptive colors that work well in both light and dark themes
  static Color getAdaptiveColor(
    BuildContext context, {
    required Color lightColor,
    required Color darkColor,
  }) {
    return isDark(context) ? darkColor : lightColor;
  }

  /// Get success color - Using tertiary accent (green)
  static Color get successColor => AppColor.secondryGradient[1];

  /// Get warning color - Using primary color blend
  static Color get warningColor =>
      Color.lerp(AppColor.primary, Colors.orange, 0.3)!;

  /// Get error color - Using third color (red)
  static Color get errorColor => AppColor.thirdColor;

  /// Get info color - Using secondary gradient blue
  static Color get infoColor => AppColor.secondryGradient[0];

  // ========== AppColor Integration Utilities ==========

  /// Get app color with theme-aware alpha adjustment
  static Color getAppColorWithAlpha(
      Color appColor, BuildContext context, double alpha) {
    return isDark(context)
        ? appColor.withValues(
            alpha: alpha * 0.8) // Slightly more transparent in dark mode
        : appColor.withValues(alpha: alpha);
  }

  /// Create gradient using app colors
  static LinearGradient getAppColorGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDark(context)
          ? [
              AppColor.primary.withValues(alpha: 0.3),
              AppColor.secondryDark.withValues(alpha: 0.3),
            ]
          : [
              AppColor.primary.withValues(alpha: 0.2),
              AppColor.secondry.withValues(alpha: 0.2),
            ],
    );
  }

  /// Get theme-aware brand color
  static Color getBrandColor(BuildContext context, {bool isPrimary = true}) {
    if (isPrimary) {
      return getAdaptiveColor(
        context,
        lightColor: AppColor.primary,
        darkColor: AppColor.primary.withValues(alpha: 0.9),
      );
    } else {
      return AppColor.applySecondary(context);
    }
  }
}

/// Extension on BuildContext for easier access to ThemeHelper
extension ThemeHelperExtension on BuildContext {
  /// Quick access to ThemeHelper.isDark
  bool get isDarkTheme => ThemeHelper.isDark(this);

  /// Quick access to ThemeHelper.isLight
  bool get isLightTheme => ThemeHelper.isLight(this);

  /// Quick access to primary text color
  Color get primaryTextColor => ThemeHelper.primaryTextColor(this);

  /// Quick access to secondary text color
  Color get secondaryTextColor => ThemeHelper.secondaryTextColor(this);

  /// Quick access to background color
  Color get backgroundColor => ThemeHelper.backgroundColor(this);

  /// Quick access to surface color
  Color get surfaceColor => ThemeHelper.surfaceColor(this);

  /// Quick access to card color
  Color get cardColor => ThemeHelper.cardColor(this);

  /// Quick access to icon color
  Color get iconColor => ThemeHelper.iconColor(this);

  /// Quick access to divider color
  Color get dividerColor => ThemeHelper.dividerColor(this);

  /// Quick access to border color
  Color get borderColor => ThemeHelper.borderColor(this);
}
