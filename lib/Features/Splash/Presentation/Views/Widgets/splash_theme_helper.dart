import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/theme_helper.dart';

/// Theme helper class for splash screen components
/// Provides consistent theming across all splash widgets with unified color system
class SplashThemeHelper {
  /// Check if current theme is dark mode
  static bool isDark(BuildContext context) => ThemeHelper.isDark(
      context); // Background Colors and Gradients with unified theme - Using AppColor
  static List<Color> getBackgroundGradientColors(
      BuildContext context, double animationValue) {
    return isDark(context)
        ? [
            const Color(0xFF0F172A), // Slate-900
            const Color(0xFF1E293B), // Slate-800
            const Color(0xFF334155), // Slate-700
            AppColor.primary.withAlpha(77),
          ]
        : [
            Colors.white,
            AppColor.primary.withAlpha(26),
            AppColor.secondry.withAlpha(26),
            AppColor.secondryDark.withAlpha(26),
          ];
  }

  static List<double> getBackgroundGradientStops() =>
      const [0.0, 0.3, 0.7, 1.0];

  static GradientTransform getBackgroundGradientTransform(
          double animationValue) =>
      GradientRotation(animationValue *
          math.pi /
          4); // Logo Colors and Shadows with unified theme - Using AppColor
  static Color getLogoPrimaryColor() => AppColor.primary;

  static Color getLogoSecondaryColor() => AppColor.primary.withAlpha(204);

  static List<BoxShadow> getLogoShadows(BuildContext context) => [
        BoxShadow(
          color: AppColor.primary.withAlpha(77),
          blurRadius: 5,
          spreadRadius: 2,
        ),
        BoxShadow(
          color: ThemeHelper.shadowColor(context),
          blurRadius: 2,
          spreadRadius: 1,
        ),
      ];

  static List<Color> getLogoGradientColors() => [
        AppColor.primary.withAlpha(204),
        AppColor.primary,
      ];
  // Text Colors and Styles with unified theme - Using AppColor
  static List<Color> getTitleGradientColors(BuildContext context) => [
        AppColor.primary,
        AppColor.secondry,
      ];
  static Color getSubtitleColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor:
            AppColor.secondry.withAlpha(179), // More subtle secondary color
        darkColor: AppColor.secondryDark.withAlpha(179), // Softer in dark mode
      );

  static Color getLoadingTextColor(BuildContext context) =>
      ThemeHelper.getAdaptiveColor(
        context,
        lightColor: AppColor.primary.withAlpha(153), // Subtle primary color
        darkColor:
            AppColor.primary.withAlpha(128), // Even more subtle in dark mode
      );
  // Particle Colors with unified theme - Using AppColor directly
  static Color getParticleColor(BuildContext context) =>
      AppColor.primary.withAlpha(77);

  static Color getParticleShadowColor(BuildContext context) =>
      AppColor.primary.withAlpha(51);

  // Animation Durations
  static const Duration logoAnimationDuration = Duration(milliseconds: 2000);
  static const Duration textAnimationDuration = Duration(milliseconds: 1500);
  static const Duration backgroundAnimationDuration =
      Duration(milliseconds: 3000);
  static const Duration rotationAnimationDuration =
      Duration(milliseconds: 4000);
  static const Duration loadingOpacityDuration = Duration(milliseconds: 500);

  // Animation Curves
  static const Curve logoScaleCurve = Curves.elasticOut;
  static const Curve logoFadeCurve = Curves.easeInOut;
  static const Curve logoSlideCurve = Curves.easeOutBack;
  static const Curve textFadeCurve = Curves.easeInOut;
  static const Curve textSlideCurve = Curves.easeOutCubic;
  static const Curve backgroundCurve = Curves.easeInOut;
  static const Curve rotationCurve = Curves.linear;
  static const Curve pulseCurve = Curves.easeInOut;

  // Animation Values
  static const double logoScaleBegin = 0.0;
  static const double logoScaleEnd = 1.0;
  static const double logoFadeBegin = 0.0;
  static const double logoFadeEnd = 1.0;
  static const Offset logoSlideBegin = Offset(0, -0.5);
  static const Offset logoSlideEnd = Offset.zero;
  static const double textFadeBegin = 0.0;
  static const double textFadeEnd = 1.0;
  static const Offset textSlideBegin = Offset(0, 0.5);
  static const Offset textSlideEnd = Offset.zero;
  static const double backgroundBegin = 0.0;
  static const double backgroundEnd = 1.0;
  static const double rotationBegin = 0.0;
  static double rotationEnd = 2 * math.pi;
  static const double pulseBegin = 1.0;
  static const double pulseEnd = 1.1;

  // Logo Fade Animation Interval
  static const Interval logoFadeInterval =
      Interval(0.0, 0.7, curve: Curves.easeInOut);

  // Sizes and Dimensions
  static const double logoSize = 150.0;
  static const double titleFontSize = 48.0;
  static const double titleLetterSpacing = 3.0;
  static const double subtitleLetterSpacing = 1.0;
  static const double loadingIconSize = 40.0;
  static const double loadingTextSize = 16.0;
  static const double particleMinSize = 2.0;
  static const double particleMaxSize = 10.0;
  static const double particleOpacity = 0.6;
  static const double particleMovement = 20.0;

  // Particle Animation
  static const int particleMinDuration = 2000;
  static const int particleMaxDuration = 5000;
  static const int particleCount = 20;

  // Spacing
  static const double mainSpacing = 40.0;
  static const double titleSubtitleSpacing = 8.0;
  static const double loadingSpacing = 16.0;
  static const double subtitleBottomSpacing = 20.0;
  static const double logoPadding = 8.0;

  // Helper methods for getting themed decorations
  static BoxDecoration getLogoContainerDecoration(
      BuildContext context, double pulseValue) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white.withAlpha(225),
      boxShadow: getLogoShadows(context),
    );
  }

  static BoxDecoration getLogoGradientDecoration() {
    return const BoxDecoration(
      shape: BoxShape.circle,
    );
  }

  static TextStyle getTitleTextStyle(BuildContext context) {
    return AppText.style28Bold(context).copyWith(
      color: AppColor.primary,
      fontSize: 48,
      letterSpacing: titleLetterSpacing,
    );
  }

  static TextStyle getSubtitleTextStyle(BuildContext context) {
    return AppText.style14Regular(context).copyWith(
      color: Colors.grey.shade400,
      letterSpacing: subtitleLetterSpacing,
    );
  }

  static TextStyle getLoadingTextStyle(BuildContext context) {
    return AppText.style16Regular(context).copyWith(
      color: getLoadingTextColor(context),
      fontWeight: FontWeight.w300,
    );
  }

  static ShaderCallback getTitleShaderCallback(BuildContext context) {
    return (bounds) => LinearGradient(
          colors: getTitleGradientColors(context),
        ).createShader(bounds);
  }

  static BoxDecoration getParticleDecoration(
      BuildContext context, double size) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: getParticleColor(context),
      boxShadow: [
        BoxShadow(
          color: getParticleShadowColor(context),
          blurRadius: size / 2,
        ),
      ],
    );
  }
}
