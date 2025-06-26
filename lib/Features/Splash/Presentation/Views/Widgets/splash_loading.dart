import 'package:flutter/material.dart';
import 'package:uccd/Core/constants.dart';
import 'package:uccd/Features/Splash/Presentation/Views/Widgets/splash_theme_helper.dart';
import 'package:uccd/generated/l10n.dart';

class SplashLoading extends StatelessWidget {
  const SplashLoading({
    super.key,
    required bool showContent,
  }) : _showContent = showContent;

  final bool _showContent;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showContent ? 1.0 : 0.0,
      duration: SplashThemeHelper.loadingOpacityDuration,
      child: Column(
        children: [
          SizedBox(
            width: SplashThemeHelper.loadingIconSize,
            height: SplashThemeHelper.loadingIconSize,
            child: getSubLoading(size: SplashThemeHelper.loadingIconSize),
          ),
          const SizedBox(height: SplashThemeHelper.loadingSpacing),
          Text(
            S.of(context).splashLoading,
            style: SplashThemeHelper.getLoadingTextStyle(context),
          ),
        ],
      ),
    );
  }
}
