import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/card_container.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/rating_indicator.dart';
import 'package:uccd/Features/User/user_view_test_widgets/themes/user_theme_helper.dart';

class RateCardView extends StatelessWidget {
  const RateCardView({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.rate,
    required this.onRatingChanged,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final double rate;
  final Function(double) onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildRatingRow(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppColor.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: UserThemeHelper.getSecondaryTextColor(context),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12,
      children: [
        StarRating(
          rating: rate,
          size: 40,
          allowHalfRating: false,
          onRatingChanged: onRatingChanged,
          color: AppColor.primary,
          borderColor: Colors.grey[300],
        ),
        RatingIndicator(
          rate: rate,
        ),
      ],
    );
  }
}
