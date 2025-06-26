import 'package:flutter/material.dart';

/// Centralized color definitions for the UCCD application.
/// This class provides the core brand colors and utility methods
/// that are used throughout the app's unified color system.
class AppColor {
  // ========== Core Brand Colors ==========

  /// Primary brand color - Golden Yellow
  static const Color primary = Color(0xFFF7B626);

  /// Secondary brand color - Dark Green
  static const Color secondry = Color(0xFF006400);

  /// Secondary dark variant - Lighter Green
  static const Color secondryDark = Color(0xFF42AE59);

  /// Tertiary brand color - Red
  static const Color thirdColor = Color(0xFFCC3027);

  /// Secondary gradient colors combining blue and green tones
  static const List<Color> secondryGradient = [
    Color(0xFF4B84B8), // Blue
    Color(0xFF42AD5A), // Green
    Color(0xFF44A769), // Light Green
  ];

  // ========== Utility Methods ==========

  /// Apply secondary color based on theme brightness
  static Color applySecondary(BuildContext context) {
    if (Theme.of(context).brightness.index == 0) {
      return secondryDark;
    } else {
      return secondry;
    }
  }

  /// Get a lighter variant of the primary color
  static Color get primaryLight => primary.withValues(alpha: 0.7);

  /// Get a darker variant of the primary color
  static Color get primaryDark => Color.lerp(primary, Colors.black, 0.2)!;

  /// Get the complementary color of the primary color
  static Color get primaryComplementary => Color(0xFF2652F7);

  /// Get the secondary color with alpha
  static Color secondaryWithAlpha(double alpha) =>
      secondry.withValues(alpha: alpha);

  /// Get the third color with alpha
  static Color thirdColorWithAlpha(double alpha) =>
      thirdColor.withValues(alpha: alpha);

  /// Get primary color with alpha
  static Color primaryWithAlpha(double alpha) =>
      primary.withValues(alpha: alpha);
}
