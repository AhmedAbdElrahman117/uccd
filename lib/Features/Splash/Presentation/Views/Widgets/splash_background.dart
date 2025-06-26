import 'package:flutter/material.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_theme_helper.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({
    super.key,
    required this.backgroundAnimation,
    required this.child,
  });

  final Animation<double> backgroundAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: SplashThemeHelper.getBackgroundGradientTransform(
              backgroundAnimation.value),
          colors: SplashThemeHelper.getBackgroundGradientColors(
              context, backgroundAnimation.value),
          stops: SplashThemeHelper.getBackgroundGradientStops(),
        ),
      ),
      child: child,
    );
  }
}
