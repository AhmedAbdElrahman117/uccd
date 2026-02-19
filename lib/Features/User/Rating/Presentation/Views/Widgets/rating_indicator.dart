import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/User/user_view_test_widgets/themes/user_theme_helper.dart';

class RatingIndicator extends StatelessWidget {
  const RatingIndicator({
    super.key,
    required this.rate,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    final bool hasRating = rate > 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: hasRating
            ? AppColor.primary.withValues(alpha: 0.1)
            : UserThemeHelper.getHintTextColor(context).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        hasRating ? '${rate.toInt()}/5' : 'Not rated',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: hasRating
              ? AppColor.primary
              : UserThemeHelper.getHintTextColor(context),
        ),
      ),
    );
  }
}
