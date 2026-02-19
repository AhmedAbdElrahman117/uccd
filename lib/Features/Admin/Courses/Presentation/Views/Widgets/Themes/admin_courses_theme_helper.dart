import 'package:flutter/material.dart';
import 'package:uccd/Core/theme_helper.dart';

/// Comprehensive Admin Courses theme helper that provides consistent theming
/// for all admin courses-related components and interactions.
///
/// This enhanced theme helper includes:
/// - Modern gradient designs
/// - Enhanced state management colors
/// - Improved animations and transitions
/// - Responsive design elements
/// - Accessibility considerations
class AdminCoursesThemeHelper {
  const AdminCoursesThemeHelper._();

  // ========== Theme Detection ==========

  /// Check if current theme is dark mode
  static bool isDark(BuildContext context) => ThemeHelper.isDark(
      context); // ========== Primary Colors - Using Unified ThemeHelper ==========

  /// Get primary accent color for admin courses
  static Color getPrimaryAccentColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context);

  /// Get secondary accent color for admin courses
  static Color getSecondaryAccentColor(BuildContext context) =>
      ThemeHelper.getSecondaryAccentColor(context);

  /// Get tertiary accent color for admin courses
  static Color getTertiaryAccentColor(BuildContext context) =>
      ThemeHelper.getTertiaryAccentColor(context);

  /// Get quaternary accent color for admin courses
  static Color getQuaternaryAccentColor(BuildContext context) =>
      ThemeHelper.getQuaternaryAccentColor(context);

  /// Get warning accent color for admin courses
  static Color getWarningAccentColor(BuildContext context) =>
      ThemeHelper.getWarningAccentColor(context);

  /// Get info accent color for admin courses
  static Color getInfoAccentColor(BuildContext context) =>
      ThemeHelper.getInfoAccentColor(context);
  // ========== Enhanced State Widget Colors ==========

  /// Get loading widget primary color
  static Color getLoadingPrimaryColor(BuildContext context) =>
      getPrimaryAccentColor(context);

  /// Get loading widget secondary color
  static Color getLoadingSecondaryColor(BuildContext context) =>
      getSecondaryAccentColor(context);

  /// Get empty state illustration color
  static Color getEmptyStateIllustrationColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF94A3B8), // Slate-400
        darkColor: const Color(0xFF64748B), // Slate-500
      );

  /// Get empty state action button color
  static Color getEmptyStateActionColor(BuildContext context) =>
      getPrimaryAccentColor(context);

  /// Get error state color
  static Color getErrorStateColor(BuildContext context) =>
      getQuaternaryAccentColor(context);

  /// Get error state background color
  static Color getErrorStateBackgroundColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor:
            getQuaternaryAccentColor(context).withAlpha(26), // Red with alpha
        darkColor:
            getQuaternaryAccentColor(context).withAlpha(26), // Red with alpha
      );

  /// Get retry button color
  static Color getRetryButtonColor(BuildContext context) =>
      getInfoAccentColor(context);

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

  // ========== Enhanced Shadow Effects ==========

  /// Get tab container shadow
  static List<BoxShadow> getTabContainerShadow(BuildContext context) => [
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withValues(alpha: 0.05),
            darkColor: Colors.black.withValues(alpha: 0.3),
          ),
          blurRadius: 20,
          offset: const Offset(0, 10),
          spreadRadius: -5,
        ),
      ];

  /// Get floating action button shadow
  static List<BoxShadow> getFabShadow(BuildContext context) => [
        BoxShadow(
          color: getPrimaryAccentColor(context).withValues(alpha: 0.3),
          blurRadius: 20,
          offset: const Offset(0, 8),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: ThemeHelper.getAdaptiveColor(
            context,
            lightColor: Colors.black.withValues(alpha: 0.1),
            darkColor: Colors.black.withValues(alpha: 0.4),
          ),
          blurRadius: 10,
          offset: const Offset(0, 4),
          spreadRadius: -2,
        ),
      ];

  // ========== Enhanced Background Gradients ==========

  /// Get main background gradient for admin courses view
  static LinearGradient getBackgroundGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: isDark(context)
          ? [
              const Color(0xFF0F172A), // Slate-900
              const Color(0xFF1E293B)
                  .withValues(alpha: 0.3), // Slate-800 with alpha
            ]
          : [
              const Color(0xFFF8FAFC), // Slate-50
              const Color(0xFFE2E8F0)
                  .withValues(alpha: 0.3), // Slate-200 with alpha
            ],
      stops: const [0.0, 1.0],
    );
  }

  /// Get tab bar gradient background
  static LinearGradient getTabBarGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDark(context)
          ? [
              const Color(0xFF1E293B).withValues(alpha: 0.95), // Slate-800
              const Color(0xFF334155).withValues(alpha: 0.9), // Slate-700
            ]
          : [
              Colors.white.withValues(alpha: 0.95),
              const Color(0xFFF1F5F9).withValues(alpha: 0.9), // Slate-100
            ],
    );
  }

  /// Get floating action button gradient
  static LinearGradient getFabGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getPrimaryAccentColor(context),
        getSecondaryAccentColor(context),
      ],
    );
  }

  /// Get main background color for admin courses view
  static Color getBackgroundColor(BuildContext context) =>
      ThemeHelper.getNeutralBackgroundColor(context);

  /// Get course card background color
  static Color getCardBackgroundColor(BuildContext context) =>
      ThemeHelper.getElevatedCardColor(context);

  /// Get course card border color
  static Color getCardBorderColor(BuildContext context) =>
      ThemeHelper.getSubtleBorderColor(context);

  /// Get course card hover background color
  static Color getCardHoverColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFFF1F5F9), // Slate-100
        darkColor: const Color(0xFF334155), // Slate-700
      );

  // ========== Tab Colors - Using Unified Colors ==========

  /// Get tab indicator color
  static Color getTabIndicatorColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context);

  /// Get active tab label color
  static Color getActiveTabLabelColor(BuildContext context) =>
      ThemeHelper.getPrimaryAccentColor(context);

  /// Get inactive tab label color
  static Color getInactiveTabLabelColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF64748B), // Slate-500
        darkColor: const Color(0xFF94A3B8), // Slate-400
      );

  /// Get tab background color
  static Color getTabBackgroundColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: Colors.white.withAlpha(77), // Semi-transparent white
        darkColor: Colors.black.withAlpha(51), // Semi-transparent black
      );

  // ========== Text Colors - Using Unified Colors ==========

  /// Get primary text color for course titles
  static Color getPrimaryTextColor(BuildContext context) =>
      ThemeHelper.primaryTextColor(context);

  /// Get secondary text color for course details
  static Color getSecondaryTextColor(BuildContext context) =>
      ThemeHelper.secondaryTextColor(context);

  /// Get course meta text color (instructor, duration, etc.)
  static Color getMetaTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF475569), // Slate-600
        darkColor: const Color(0xFF64748B), // Slate-500
      );

  // ========== Status Colors ==========

  /// Get available course status color
  static Color getAvailableStatusColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF059669), // Emerald-600
        darkColor: const Color(0xFF10B981), // Emerald-500
      );

  /// Get archive course status color
  static Color getArchiveStatusColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF7C3AED), // Violet-600
        darkColor: const Color(0xFF8B5CF6), // Violet-500
      );

  /// Get available status background color
  static Color getAvailableStatusBackgroundColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor:
            const Color(0xFF059669).withAlpha(26), // Emerald-600 with alpha
        darkColor:
            const Color(0xFF10B981).withAlpha(51), // Emerald-500 with alpha
      );

  /// Get archive status background color
  static Color getArchiveStatusBackgroundColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor:
            const Color(0xFF7C3AED).withAlpha(26), // Violet-600 with alpha
        darkColor:
            const Color(0xFF8B5CF6).withAlpha(51), // Violet-500 with alpha
      );

  // ========== Action Colors ==========

  /// Get edit action color
  static Color getEditActionColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF3B82F6), // Blue-500
        darkColor: const Color(0xFF60A5FA), // Blue-400
      );

  /// Get delete action color
  static Color getDeleteActionColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFFEF4444), // Red-500
        darkColor: const Color(0xFFF87171), // Red-400
      );

  /// Get view action color
  static Color getViewActionColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF8B5CF6), // Violet-500
        darkColor: const Color(0xFFA78BFA), // Violet-400
      );

  /// Get statistics action color
  static Color getStatisticsActionColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFF06B6D4), // Cyan-500
        darkColor: const Color(0xFF22D3EE), // Cyan-400
      );

  // ========== Action Background Colors ==========

  /// Get edit action background color
  static Color getEditActionBackgroundColor(BuildContext context) =>
      getEditActionColor(context).withAlpha(26);

  /// Get delete action background color
  static Color getDeleteActionBackgroundColor(BuildContext context) =>
      getDeleteActionColor(context).withAlpha(26);

  /// Get view action background color
  static Color getViewActionBackgroundColor(BuildContext context) =>
      getViewActionColor(context).withAlpha(26);

  /// Get statistics action background color
  static Color getStatisticsActionBackgroundColor(BuildContext context) =>
      getStatisticsActionColor(context).withAlpha(26);

  // ========== Shadows and Elevation ==========

  /// Get course card shadow
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

  // ========== Gradients ==========

  /// Get main header gradient
  static LinearGradient getHeaderGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        getPrimaryAccentColor(context),
        getSecondaryAccentColor(context),
      ],
    );
  }

  /// Get card overlay gradient for featured courses
  static LinearGradient getCardOverlayGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black.withAlpha(128), // 50% opacity
      ],
    );
  }
  // ========== App Bar Styling ==========

  /// Get subtle app bar gradient
  static LinearGradient getAppBarGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDark(context)
          ? [
              const Color(0xFF1E293B), // Slate-800
              const Color(0xFF0F172A), // Slate-900
            ]
          : [
              const Color(0xFFFFFBF0), // Very light warm
              const Color(0xFFF8F9FA), // Light gray
            ],
    );
  }

  /// Get app bar background color (simpler option)
  static Color getAppBarBackgroundColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: const Color(0xFFFFFBF0), // Very light warm background
        darkColor: Colors.black, // Slate-800
      );

  // ========== Spacing and Sizing ==========

  /// Card padding
  static const double cardPadding = 16.0;

  /// Card margin
  static const double cardMargin = 12.0;

  /// Card border radius
  static const double cardBorderRadius = 16.0;

  /// Small spacing
  static const double spacingSmall = 8.0;

  /// Medium spacing
  static const double spacingMedium = 16.0;

  /// Large spacing
  static const double spacingLarge = 24.0;

  /// Extra large spacing
  static const double spacingXLarge = 32.0;

  // ========== Utility Methods ==========

  /// Get course card decoration with adaptive theming
  static BoxDecoration getCardDecoration(
    BuildContext context, {
    bool isElevated = false,
    bool hasBorder = true,
  }) {
    return BoxDecoration(
      color: getCardBackgroundColor(context),
      borderRadius: BorderRadius.circular(cardBorderRadius),
      border: hasBorder
          ? Border.all(
              color: getCardBorderColor(context),
              width: 1,
            )
          : null,
      boxShadow:
          isElevated ? getElevatedCardShadow(context) : getCardShadow(context),
    );
  }

  /// Get status chip decoration
  static BoxDecoration getStatusChipDecoration(
    BuildContext context, {
    required bool isAvailable,
  }) {
    return BoxDecoration(
      color: isAvailable
          ? getAvailableStatusBackgroundColor(context)
          : getArchiveStatusBackgroundColor(context),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isAvailable
            ? getAvailableStatusColor(context).withAlpha(77)
            : getArchiveStatusColor(context).withAlpha(77),
        width: 1,
      ),
    );
  }

  /// Get action button decoration
  static BoxDecoration getActionButtonDecoration(
    BuildContext context, {
    required AdminCourseActionType actionType,
  }) {
    Color backgroundColor;
    Color borderColor;

    switch (actionType) {
      case AdminCourseActionType.edit:
        backgroundColor = getEditActionBackgroundColor(context);
        borderColor = getEditActionColor(context).withAlpha(77);
        break;
      case AdminCourseActionType.delete:
        backgroundColor = getDeleteActionBackgroundColor(context);
        borderColor = getDeleteActionColor(context).withAlpha(77);
        break;
      case AdminCourseActionType.view:
        backgroundColor = getViewActionBackgroundColor(context);
        borderColor = getViewActionColor(context).withAlpha(77);
        break;
      case AdminCourseActionType.statistics:
        backgroundColor = getStatisticsActionBackgroundColor(context);
        borderColor = getStatisticsActionColor(context).withAlpha(77);
        break;
    }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: borderColor,
        width: 1,
      ),
    );
  }

  /// Get action button color
  static Color getActionButtonColor(
    BuildContext context, {
    required AdminCourseActionType actionType,
  }) {
    switch (actionType) {
      case AdminCourseActionType.edit:
        return getEditActionColor(context);
      case AdminCourseActionType.delete:
        return getDeleteActionColor(context);
      case AdminCourseActionType.view:
        return getViewActionColor(context);
      case AdminCourseActionType.statistics:
        return getStatisticsActionColor(context);
    }
  }

  /// Get ripple color for interactive elements
  static Color getRippleColor(BuildContext context) =>
      getPrimaryAccentColor(context).withAlpha(51); // 20% opacity

  // ========== Enhanced Component Utilities ==========

  /// Get enhanced tab bar decoration
  static BoxDecoration getEnhancedTabBarDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: getTabBarGradient(context),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      boxShadow: getTabContainerShadow(context),
      border: Border.all(
        color: ThemeHelper.getAdaptiveColor(
          context,
          lightColor: Colors.white.withValues(alpha: 0.2),
          darkColor: Colors.white.withValues(alpha: 0.1),
        ),
        width: 1,
      ),
    );
  }

  /// Get enhanced floating action button decoration
  static BoxDecoration getFabDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: getFabGradient(context),
      borderRadius: BorderRadius.circular(16),
      boxShadow: getFabShadow(context),
    );
  }

  /// Get enhanced tab indicator decoration
  static BoxDecoration getTabIndicatorDecoration(BuildContext context) {
    return BoxDecoration(
      color: getPrimaryAccentColor(context),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: getPrimaryAccentColor(context).withValues(alpha: 0.3),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
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

  /// Get enhanced button press animation scale
  static const double buttonPressScale = 0.95;

  /// Get enhanced ripple radius
  static const double enhancedRippleRadius = 24.0;
}

/// Enum for different admin course action types
enum AdminCourseActionType {
  edit,
  delete,
  view,
  statistics,
}
