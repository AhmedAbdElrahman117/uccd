import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/card_container.dart';
import 'package:uccd/Features/User/user_view_test_widgets/themes/user_theme_helper.dart';

class RateCourseHeader extends StatelessWidget {
  const RateCourseHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          const Icon(
            Icons.school_rounded,
            size: 48,
            color: AppColor.primary,
          ),
          const SizedBox(height: 12),
          Text(
            'Share Your Experience',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your feedback helps improve the learning experience for everyone',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: UserThemeHelper.getSecondaryTextColor(context),
                ),
          ),
        ],
      ),
    );
  }
}
