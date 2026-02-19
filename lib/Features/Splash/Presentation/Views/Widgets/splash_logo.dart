import 'package:flutter/material.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_theme_helper.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
    required Animation<Offset> logoSlideAnimation,
    required Animation<double> logoFadeAnimation,
    required Animation<double> logoScaleAnimation,
    required Animation<double> pulseAnimation,
  })  : _logoSlideAnimation = logoSlideAnimation,
        _logoFadeAnimation = logoFadeAnimation,
        _logoScaleAnimation = logoScaleAnimation,
        _pulseAnimation = pulseAnimation;

  final Animation<Offset> _logoSlideAnimation;
  final Animation<double> _logoFadeAnimation;
  final Animation<double> _logoScaleAnimation;
  final Animation<double> _pulseAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _logoSlideAnimation,
      child: FadeTransition(
        opacity: _logoFadeAnimation,
        child: ScaleTransition(
          scale: _logoScaleAnimation,
          child: AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Container(
                width: SplashThemeHelper.logoSize * _pulseAnimation.value,
                height: SplashThemeHelper.logoSize * _pulseAnimation.value,
                decoration: SplashThemeHelper.getLogoContainerDecoration(
                  context,
                  _pulseAnimation.value,
                ),
                child: Container(
                  decoration: SplashThemeHelper.getLogoGradientDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(SplashThemeHelper.logoPadding),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        AppAssets.imagesUCCDLOGO,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
