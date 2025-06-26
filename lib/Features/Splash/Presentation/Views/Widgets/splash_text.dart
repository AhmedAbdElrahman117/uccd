import 'package:flutter/material.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class SplashText extends StatelessWidget {
  const SplashText({
    super.key,
    required Animation<Offset> textSlideAnimation,
    required Animation<double> textFadeAnimation,
  })  : _textSlideAnimation = textSlideAnimation,
        _textFadeAnimation = textFadeAnimation;

  final Animation<Offset> _textSlideAnimation;
  final Animation<double> _textFadeAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _textSlideAnimation,
      child: FadeTransition(
        opacity: _textFadeAnimation,
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'UCCD',
                style: SplashThemeHelper.getTitleTextStyle(context),
              ),
            ),
            const SizedBox(height: SplashThemeHelper.titleSubtitleSpacing),
            Text(
              S.of(context).splashText,
              style: SplashThemeHelper.getSubtitleTextStyle(context),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
