import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';

/// Comprehensive Admin Home theme helper that provides consistent theming
/// for all admin home-related components and interactions.
///
/// This theme helper includes:
/// - Modern gradient designs
/// - Enhanced component styling
/// - Dashboard-specific colors
/// - Quick action theming
/// - Improved animations and transitions
/// - Responsive design elements
class AdminHomeThemeHelper {
  const AdminHomeThemeHelper._();

  // ========== Theme Detection ==========

  /// Check if current theme is dark mode
  static bool isDark(BuildContext context) => ThemeHelper.isDark(
      context); // ========== Primary Colors - Using Unified ThemeHelper ==========

  /// Get primary accent color for admin home - Using unified color system
  static Color getPrimaryAccentColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context);

  /// Get secondary accent color for admin home - Using unified color system
  static Color getSecondaryAccentColor(BuildContext context) =>
      ThemeHelper.getSecondaryAccentColor(context);

  /// Get tertiary accent color for admin home - Using unified color system
  static Color getTertiaryAccentColor(BuildContext context) =>
      ThemeHelper.getTertiaryAccentColor(context);

  /// Get quaternary accent color for admin home - Using unified color system
  static Color getQuaternaryAccentColor(BuildContext context) =>
      ThemeHelper.getQuaternaryAccentColor(context);

  /// Get warning accent color for admin home - Using unified color system
  static Color getWarningAccentColor(BuildContext context) =>
      ThemeHelper.getWarningAccentColor(context);
  // ========== Background Colors - Using Unified ThemeHelper ==========

  /// Get main background color for admin home view
  static Color getBackgroundColor(BuildContext context) =>
      ThemeHelper.getNeutralBackgroundColor(context);

  /// Get background gradient for admin home
  static LinearGradient getBackgroundGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDark(context)
          ? [
              ThemeHelper.getNeutralBackgroundColor(context),
              const Color(0xFF1E293B), // Slate-800
              const Color(0xFF334155), // Slate-700
            ]
          : [
              ThemeHelper.getNeutralBackgroundColor(context),
              const Color(0xFFF1F5F9), // Slate-100
              Colors.white,
            ],
    );
  }

  // ========== Header Colors - Using Unified Colors ==========

  /// Get header background color
  static Color getHeaderBackgroundColor(BuildContext context) =>
      ThemeHelper.getElevatedCardColor(context);

  /// Get header gradient
  static LinearGradient getHeaderGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ThemeHelper.getPrimaryAccentColor(context),
        ThemeHelper.getSecondaryAccentColor(context),
      ],
    );
  }

  // ========== Quick Actions Colors - Using Unified Colors ==========
  /// Get quick actions container background color
  static Color getQuickActionsBackgroundColor(BuildContext context) =>
      ThemeHelper.getElevatedCardColor(context);

  /// Get quick actions gradient
  static LinearGradient getQuickActionsGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDark(context)
          ? [
              ThemeHelper.getElevatedCardColor(context),
              const Color(0xFF334155), // Slate-700
            ]
          : [
              Colors.white,
              ThemeHelper.getNeutralBackgroundColor(context),
            ],
    );
  }

  /// Get action card background color
  static Color getActionCardBackgroundColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: Colors.white.withAlpha(230), // Semi-transparent white
        darkColor: Colors.white.withAlpha(26), // Semi-transparent white
      );

  /// Get action card border color
  static Color getActionCardBorderColor(BuildContext context) =>
      ThemeHelper.getSubtleBorderColor(context);

  /// Get action card text color
  static Color getActionCardTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: Colors.white,
        darkColor: Colors.white,
      );

  /// Get action card icon color
  static Color getActionCardIconColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: Colors.white,
        darkColor: Colors.white,
      );

  // ========== Dashboard Colors - Using Unified Colors ==========

  /// Get dashboard card background color
  static Color getDashboardCardBackgroundColor(BuildContext context) =>
      ThemeHelper.getElevatedCardColor(context);

  /// Get dashboard card border color
  static Color getDashboardCardBorderColor(BuildContext context) =>
      ThemeHelper.getSubtleBorderColor(context);

  /// Get dashboard section title color
  static Color getDashboardTitleColor(BuildContext context) =>
      ThemeHelper.primaryTextColor(context);

  // ========== Statistics Colors - Using Unified Colors ==========

  /// Get statistics primary color
  static Color getStatisticsPrimaryColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context);

  /// Get statistics secondary color
  static Color getStatisticsSecondaryColor(BuildContext context) =>
      ThemeHelper.getSecondaryAccentColor(context);

  /// Get statistics background color
  static Color getStatisticsBackgroundColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFFF1F5F9), // Slate-100
        darkColor: const Color(0xFF334155), // Slate-700
      );

  // ========== Text Colors - Using Unified Colors ==========

  /// Get primary text color
  static Color getPrimaryTextColor(BuildContext context) =>
      ThemeHelper.primaryTextColor(context);

  /// Get secondary text color
  static Color getSecondaryTextColor(BuildContext context) =>
      ThemeHelper.secondaryTextColor(context);

  /// Get meta text color
  static Color getMetaTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF475569), // Slate-600
        darkColor: const Color(0xFF64748B), // Slate-500
      );
  // ========== Interactive Colors - Using Unified Colors ==========

  /// Get card hover color
  static Color getCardHoverColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFFF1F5F9), // Slate-100
        darkColor: const Color(0xFF334155), // Slate-700
      );

  /// Get card ripple color
  static Color getCardRippleColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context).withAlpha(51); // 20% opacity

  /// Get button hover color
  static Color getButtonHoverColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context).withAlpha(26); // 10% opacity

  // ========== Shadows and Elevation ==========

  /// Get card shadow
  static List<BoxShadow> getCardShadow(BuildContext context) => [
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withAlpha(13), // 5% opacity
            darkColor: Colors.black.withAlpha(77), // 30% opacity
          ),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withAlpha(8), // 3% opacity
            darkColor: Colors.black.withAlpha(51), // 20% opacity
          ),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];

  /// Get elevated card shadow (for hover or active states)
  static List<BoxShadow> getElevatedCardShadow(BuildContext context) => [
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withAlpha(20), // 8% opacity
            darkColor: Colors.black.withAlpha(102), // 40% opacity
          ),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withAlpha(13), // 5% opacity
            darkColor: Colors.black.withAlpha(77), // 30% opacity
          ),
          blurRadius: 32,
          offset: const Offset(0, 12),
        ),
      ];

  /// Get floating action button shadow
  static List<BoxShadow> getFabShadow(BuildContext context) => [
        BoxShadow(
          color: getPrimaryAccentColor(context).withAlpha(77),
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withAlpha(13),
            darkColor: Colors.black.withAlpha(102),
          ),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  // ========== Animation Constants ==========

  /// Standard animation duration for UI transitions
  static const Duration animationDuration = Duration(milliseconds: 300);

  /// Fast animation duration for quick interactions
  static const Duration fastAnimationDuration = Duration(milliseconds: 150);

  /// Slow animation duration for complex transitions
  static const Duration slowAnimationDuration = Duration(milliseconds: 500);

  /// Stagger duration for list animations
  static const Duration staggerDuration = Duration(milliseconds: 100);

  /// Animation curve for smooth transitions
  static const Curve animationCurve = Curves.easeInOutCubic;

  /// Animation curve for bouncy effects
  static const Curve bouncyCurve = Curves.elasticOut;

  // ========== Spacing Constants ==========

  /// Extra small spacing
  static const double spacingXS = 4.0;

  /// Small spacing
  static const double spacingSmall = 8.0;

  /// Medium spacing
  static const double spacingMedium = 16.0;

  /// Large spacing
  static const double spacingLarge = 24.0;

  /// Extra large spacing
  static const double spacingXL = 32.0;

  /// Extra extra large spacing
  static const double spacingXXL = 48.0;

  // ========== Border Radius Constants ==========

  /// Small border radius
  static const double radiusSmall = 8.0;

  /// Medium border radius
  static const double radiusMedium = 12.0;

  /// Large border radius
  static const double radiusLarge = 16.0;

  /// Extra large border radius
  static const double radiusXL = 20.0;

  /// Card border radius
  static const double radiusCard = 16.0;

  /// Button border radius
  static const double radiusButton = 12.0;

  // ========== Enhanced Component Decorations ==========

  /// Get enhanced card decoration
  static BoxDecoration getEnhancedCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: getDashboardCardBackgroundColor(context),
      borderRadius: BorderRadius.circular(radiusCard),
      border: Border.all(
        color: getDashboardCardBorderColor(context),
        width: 1,
      ),
      boxShadow: getCardShadow(context),
    );
  }

  /// Get enhanced action card decoration
  static BoxDecoration getEnhancedActionCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: getActionCardBackgroundColor(context),
      borderRadius: BorderRadius.circular(radiusMedium),
      border: Border.all(
        color: getActionCardBorderColor(context),
        width: 1,
      ),
      boxShadow: getCardShadow(context),
    );
  }

  /// Get enhanced quick actions container decoration
  static BoxDecoration getEnhancedQuickActionsDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: getQuickActionsGradient(context),
      borderRadius: BorderRadius.circular(radiusLarge),
      border: isDark(context)
          ? null
          : Border.all(
              color: const Color(0xFFE2E8F0), // Slate-200 border for light mode
              width: 1,
            ),
      boxShadow: isDark(context)
          ? getElevatedCardShadow(context)
          : getCardShadow(context), // Less shadow for light mode
    );
  }

  /// Get enhanced floating action button decoration
  static BoxDecoration getFabDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          getPrimaryAccentColor(context),
          getSecondaryAccentColor(context),
        ],
      ),
      borderRadius: BorderRadius.circular(radiusMedium),
      boxShadow: getFabShadow(context),
    );
  }

  /// Get loading shimmer gradient
  static LinearGradient getLoadingShimmerGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.grey[300]!,
          darkColor: Colors.grey[700]!,
        ),
        ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.grey[100]!,
          darkColor: Colors.grey[600]!,
        ),
        ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.grey[300]!,
          darkColor: Colors.grey[700]!,
        ),
      ],
      stops: const [0.1, 0.3, 0.4],
      begin: const Alignment(-1.0, -0.3),
      end: const Alignment(1.0, 0.3),
      tileMode: TileMode.clamp,
    );
  }

  // ========== Sophisticated Gradients ==========

  /// Get primary card gradient
  static LinearGradient getPrimaryCardGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getPrimaryAccentColor(context),
        getPrimaryAccentColor(context).withAlpha(217), // 85% opacity
        getPrimaryAccentColor(context).withAlpha(179), // 70% opacity
      ],
      stops: const [0.0, 0.6, 1.0],
    );
  }

  /// Get secondary card gradient
  static LinearGradient getSecondaryCardGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getSecondaryAccentColor(context),
        getSecondaryAccentColor(context).withAlpha(217), // 85% opacity
        getSecondaryAccentColor(context).withAlpha(179), // 70% opacity
      ],
      stops: const [0.0, 0.6, 1.0],
    );
  }

  /// Get tertiary card gradient
  static LinearGradient getTertiaryCardGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getTertiaryAccentColor(context),
        getTertiaryAccentColor(context).withAlpha(217), // 85% opacity
        getTertiaryAccentColor(context).withAlpha(179), // 70% opacity
      ],
      stops: const [0.0, 0.6, 1.0],
    );
  }

  /// Get quaternary card gradient
  static LinearGradient getQuaternaryCardGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getQuaternaryAccentColor(context),
        getQuaternaryAccentColor(context).withAlpha(217), // 85% opacity
        getQuaternaryAccentColor(context).withAlpha(179), // 70% opacity
      ],
      stops: const [0.0, 0.6, 1.0],
    );
  }

  /// Get warning card gradient
  static LinearGradient getWarningCardGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getWarningAccentColor(context),
        getWarningAccentColor(context).withAlpha(217), // 85% opacity
        getWarningAccentColor(context).withAlpha(179), // 70% opacity
      ],
      stops: const [0.0, 0.6, 1.0],
    );
  }

  /// Get mixed gradient (primary to secondary)
  static LinearGradient getMixedGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getPrimaryAccentColor(context),
        getSecondaryAccentColor(context),
      ],
    );
  }

  /// Get success gradient (green tones)
  static LinearGradient getSuccessGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getTertiaryAccentColor(context),
        getTertiaryAccentColor(context).withAlpha(204), // 80% opacity
      ],
    );
  }

  /// Get danger gradient (red tones)
  static LinearGradient getDangerGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getQuaternaryAccentColor(context),
        getQuaternaryAccentColor(context).withAlpha(204), // 80% opacity
      ],
    );
  }

  // ========== Enhanced Interactive Colors ==========

  /// Get primary elevated button color
  static Color getPrimaryElevatedButtonColor(BuildContext context) =>
      getPrimaryAccentColor(context);

  /// Get secondary elevated button color
  static Color getSecondaryElevatedButtonColor(BuildContext context) =>
      getSecondaryAccentColor(context);

  /// Get tertiary elevated button color
  static Color getTertiaryElevatedButtonColor(BuildContext context) =>
      getTertiaryAccentColor(context);

  /// Get quaternary elevated button color
  static Color getQuaternaryElevatedButtonColor(BuildContext context) =>
      getQuaternaryAccentColor(context);

  /// Get warning elevated button color
  static Color getWarningElevatedButtonColor(BuildContext context) =>
      getWarningAccentColor(context);

  /// Get success elevated button color
  static Color getSuccessElevatedButtonColor(BuildContext context) =>
      getTertiaryAccentColor(context);

  /// Get danger elevated button color
  static Color getDangerElevatedButtonColor(BuildContext context) =>
      getQuaternaryAccentColor(context);

  /// Get primary text button color
  static Color getPrimaryTextButtonColor(BuildContext context) =>
      getPrimaryTextColor(context);

  /// Get secondary text button color
  static Color getSecondaryTextButtonColor(BuildContext context) =>
      getSecondaryTextColor(context);

  /// Get tertiary text button color
  static Color getTertiaryTextButtonColor(BuildContext context) =>
      getMetaTextColor(context);

  /// Get quaternary text button color
  static Color getQuaternaryTextButtonColor(BuildContext context) =>
      getPrimaryTextColor(context);

  /// Get warning text button color
  static Color getWarningTextButtonColor(BuildContext context) =>
      getPrimaryTextColor(context);

  /// Get success text button color
  static Color getSuccessTextButtonColor(BuildContext context) =>
      getPrimaryTextColor(context);

  /// Get danger text button color
  static Color getDangerTextButtonColor(BuildContext context) =>
      getPrimaryTextColor(context);

  /// Get enhanced card hover state
  static Color getEnhancedCardHoverColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: getPrimaryAccentColor(context).withAlpha(13), // 5% opacity
        darkColor: getPrimaryAccentColor(context).withAlpha(26), // 10% opacity
      );

  /// Get enhanced button active state
  static Color getEnhancedButtonActiveColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: getPrimaryAccentColor(context).withAlpha(26), // 10% opacity
        darkColor: getPrimaryAccentColor(context).withAlpha(51), // 20% opacity
      );

  /// Get surface overlay color for better theme consistency
  static Color getSurfaceOverlayColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: Colors.white.withAlpha(242), // 95% opacity
        darkColor: const Color(0xFF1E293B)
            .withAlpha(242), // Slate-800 with 95% opacity
      );

  /// Get backdrop overlay color
  static Color getBackdropOverlayColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: Colors.black.withAlpha(77), // 30% opacity
        darkColor: Colors.black.withAlpha(128), // 50% opacity
      );

  // ========== Enhanced Text Colors ==========

  /// Get accent text color
  static Color getAccentTextColor(BuildContext context) =>
      getPrimaryAccentColor(context);

  /// Get caption text color (lighter than secondary)
  static Color getCaptionTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF94A3B8), // Slate-400
        darkColor: const Color(0xFF64748B), // Slate-500
      );

  /// Get success text color
  static Color getSuccessTextColor(BuildContext context) =>
      getTertiaryAccentColor(context);

  /// Get warning text color
  static Color getWarningTextColor(BuildContext context) =>
      getWarningAccentColor(context);

  /// Get error text color
  static Color getErrorTextColor(BuildContext context) =>
      getQuaternaryAccentColor(context);

  // ========== Accessibility & Contrast Enhancements ==========

  /// Get high contrast text color for better accessibility
  static Color getHighContrastTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF0F172A), // Slate-900 - highest contrast
        darkColor: const Color(0xFFFFFFFF), // Pure white for dark mode
      );

  /// Get medium contrast text color
  static Color getMediumContrastTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF334155), // Slate-700
        darkColor: const Color(0xFFE2E8F0), // Slate-200
      );

  /// Get focus ring color for accessibility
  static Color getFocusRingColor(BuildContext context) =>
      getPrimaryAccentColor(context);

  /// Get selection color
  static Color getSelectionColor(BuildContext context) =>
      getPrimaryAccentColor(context).withAlpha(77); // 30% opacity

  // ========== Theme Transition Support ==========

  /// Get transition duration for theme changes
  static const Duration themeTransitionDuration = Duration(milliseconds: 200);

  /// Get theme transition curve
  static const Curve themeTransitionCurve = Curves.easeInOut;

  // ========== Component-Specific Utilities ==========

  /// Check if component should use light or dark content
  static bool shouldUseLightContent(Color backgroundColor) {
    // Calculate luminance to determine if light or dark content should be used
    final luminance = backgroundColor.computeLuminance();
    return luminance < 0.5;
  }

  /// Get appropriate content color based on background
  static Color getContentColorForBackground(Color backgroundColor) {
    return shouldUseLightContent(backgroundColor) ? Colors.white : Colors.black;
  }

  /// Get appropriate secondary content color based on background
  static Color getSecondaryContentColorForBackground(Color backgroundColor) {
    return shouldUseLightContent(backgroundColor)
        ? Colors.white.withAlpha(179) // 70% opacity
        : Colors.black.withAlpha(179); // 70% opacity
  }

  // ========== Quick Action Card Gradients ==========

  /// Get quick action card gradient for primary actions
  static List<Color> getQuickActionPrimaryGradient(BuildContext context) => [
        getPrimaryAccentColor(context),

        getPrimaryAccentColor(context).withAlpha(204) // 80% for dark
        , // Indigo-700 for light
      ];

  /// Get quick action card gradient for secondary actions
  static List<Color> getQuickActionSecondaryGradient(BuildContext context) => [
        getSecondaryAccentColor(context),
        getSecondaryAccentColor(context).withAlpha(204) // 80% for dark
        , // Violet-700 for light
      ];

  /// Get quick action card gradient for tertiary actions
  static List<Color> getQuickActionTertiaryGradient(BuildContext context) => [
        getTertiaryAccentColor(context),
        isDark(context)
            ? getTertiaryAccentColor(context).withAlpha(204) // 80% for dark
            : const Color(0xFF047857), // Emerald-700 for light
      ];

  /// Get quick action card gradient for quaternary actions
  static List<Color> getQuickActionQuaternaryGradient(BuildContext context) => [
        getQuaternaryAccentColor(context),
        isDark(context)
            ? getQuaternaryAccentColor(context).withAlpha(204) // 80% for dark
            : const Color(0xFFB91C1C), // Red-700 for light
      ];

  /// Get quick action card gradient for warning actions
  static List<Color> getQuickActionWarningGradient(BuildContext context) => [
        getWarningAccentColor(context),
        isDark(context)
            ? getWarningAccentColor(context).withAlpha(204) // 80% for dark
            : const Color(0xFFB45309), // Amber-700 for light
      ];

  // ========== Dashboard Card Gradients ==========

  /// Get dashboard card gradient for analytics
  static List<Color> getDashboardAnalyticsGradient(BuildContext context) => [
        getSecondaryAccentColor(context),
        isDark(context)
            ? getSecondaryAccentColor(context).withAlpha(204) // 80% for dark
            : const Color(0xFF6D28D9), // Violet-700 for light
      ];

  /// Get dashboard card gradient for settings
  static List<Color> getDashboardSettingsGradient(BuildContext context) => [
        getPrimaryAccentColor(context),
        getPrimaryAccentColor(context).withAlpha(204) // 80% for dark
        , // Indigo-700 for light
      ];
}
