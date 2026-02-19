import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_theme_helper.dart';

class FloatingParticles extends StatelessWidget {
  const FloatingParticles({
    super.key,
    required this.index,
    required this.screenSize,
    required this.rotationAnimation,
    required this.backgroundAnimation,
  });

  final int index;
  final Size screenSize;
  final Animation<double> rotationAnimation;
  final Animation<double> backgroundAnimation;

  @override
  Widget build(BuildContext context) {
    final random = math.Random(index);
    final size = random.nextDouble() *
            (SplashThemeHelper.particleMaxSize -
                SplashThemeHelper.particleMinSize) +
        SplashThemeHelper.particleMinSize;
    final duration = random.nextInt(SplashThemeHelper.particleMaxDuration -
            SplashThemeHelper.particleMinDuration) +
        SplashThemeHelper.particleMinDuration;

    return AnimatedBuilder(
      animation: rotationAnimation,
      builder: (context, child) {
        final offset = Offset(
          (screenSize.width * random.nextDouble()) +
              (math.sin(rotationAnimation.value + index) *
                  SplashThemeHelper.particleMovement),
          (screenSize.height * random.nextDouble()) +
              (math.cos(rotationAnimation.value + index) *
                  SplashThemeHelper.particleMovement),
        );
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          child: AnimatedOpacity(
            opacity:
                backgroundAnimation.value * SplashThemeHelper.particleOpacity,
            duration: Duration(milliseconds: duration),
            child: Container(
              width: size,
              height: size,
              decoration:
                  SplashThemeHelper.getParticleDecoration(context, size),
            ),
          ),
        );
      },
    );
  }
}
