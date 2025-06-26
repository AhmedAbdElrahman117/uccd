import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/rating_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Rating/rating_metric.dart';
import 'package:uccd/generated/l10n.dart';

class CourseRatingSummary extends StatelessWidget {
  const CourseRatingSummary({
    super.key,
    required this.averageOverall,
    required this.contentOverall,
    required this.instructorOverall,
    required this.ratings,
  });

  final double averageOverall;
  final double contentOverall;
  final double instructorOverall;
  final List<RatingModel> ratings;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 12,
            children: [
              const Icon(
                Icons.analytics_outlined,
                color: AppColor.primary,
              ),
              Text(
                S.of(context).ratingOverview,
                style: AppText.style18Bold(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: RatingMetric(
                  label: S.of(context).overallRating,
                  rating: averageOverall,
                  icon: Icons.star,
                  color: Colors.amber,
                ),
              ),
              Expanded(
                child: RatingMetric(
                  label: S.of(context).contentRating,
                  rating: contentOverall,
                  icon: Icons.book,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: RatingMetric(
                  label: S.of(context).instructorRating,
                  rating: instructorOverall,
                  icon: Icons.person,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.people_outline,
                size: 16,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 4),
              Text(
                S.of(context).reviewsCount(
                    AppDates.formatLocalizedNumber(ratings.length, context)),
                style: AppText.style14Regular(context).copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
