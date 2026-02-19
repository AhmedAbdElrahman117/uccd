import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Features/Admin/Home/Presentation/Views/Widgets/AppBar/user_logo.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/components/decorative_circle.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/components/welcome_content.dart';

class HomeWelcomeSection extends StatelessWidget {
  const HomeWelcomeSection({
    super.key,
    this.onAvatarTap,
    this.onContinueLearningTap,
    this.primaryGradientColor,
    this.secondaryGradientColor,
    this.showContinueLearningButton = true,
  });

  final VoidCallback? onAvatarTap;
  final VoidCallback? onContinueLearningTap;
  final Color? primaryGradientColor;
  final Color? secondaryGradientColor;
  final bool? showContinueLearningButton;

  @override
  Widget build(BuildContext context) {
    final gradientStart = primaryGradientColor ??
        ThemeHelper.getAdaptiveColor(
          context,
          lightColor: ThemeHelper.appPrimaryColor.withAlpha(230),
          darkColor: const Color(0xFF303030),
        );
    final gradientEnd = secondaryGradientColor ??
        ThemeHelper.getAdaptiveColor(
          context,
          lightColor: ThemeHelper.appSecondaryColor.withAlpha(204),
          darkColor: const Color(0xFF212121),
        );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [gradientStart, gradientEnd],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: ThemeHelper.getAdaptiveColor(
              context,
              lightColor: Colors.black.withAlpha(26),
              darkColor: Colors.black.withAlpha(77),
            ),
            blurRadius: 3,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          const Positioned(
            right: -20,
            top: -20,
            child: DecorativeCircle(size: 100),
          ),
          const Positioned(
            left: 30,
            bottom: -30,
            child: DecorativeCircle(size: 80),
          ),
          const Positioned(
            left: 0,
            top: -20,
            child: DecorativeCircle(size: 100),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 30, 24, 35),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WelcomeContent(
                  onContinueLearningTap: onContinueLearningTap,
                  textColor: ThemeHelper.getAdaptiveColor(
                    context,
                    lightColor: Colors.white,
                    darkColor: Colors.white,
                  ),
                  showContinueLearningButton: showContinueLearningButton,
                ),
                GestureDetector(
                  onTap: onAvatarTap,
                  child: UserLogo(
                    radius: MediaQuery.sizeOf(context).width * 0.111,
                    backgroundColor: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
