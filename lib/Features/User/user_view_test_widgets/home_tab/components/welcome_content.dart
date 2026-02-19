import 'package:flutter/material.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/components/welcome_text.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/components/user_name_text.dart';
import 'package:uccd/Features/User/user_view_test_widgets/home_tab/components/continue_learning_button.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    super.key,
    this.onContinueLearningTap,
    this.textColor,
    this.showContinueLearningButton = true,
  });

  final VoidCallback? onContinueLearningTap;
  final Color? textColor;
  final bool? showContinueLearningButton;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          WelcomeText(
            textColor: textColor,
          ),
          const SizedBox(height: 6),
          UserNameText(
            textColor: textColor,
          ),
          Visibility(
            visible: showContinueLearningButton!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                ContinueLearningButton(
                  onTap: onContinueLearningTap,
                  textColor: textColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
