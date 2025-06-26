import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:intl/intl.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/rating_model.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/generated/l10n.dart';

class UserRatingCard extends StatelessWidget {
  const UserRatingCard({
    super.key,
    required this.rating,
  });

  final RatingModel rating;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      verticalPadding: 16,
      horizontalPadding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info and Overall Rating
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.primary.withValues(alpha: 0.1),
                child: Text(
                  rating.userName.isNotEmpty
                      ? rating.userName[0].toUpperCase()
                      : 'U',
                  style: AppText.style16Bold(context).copyWith(
                    color: AppColor.primary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rating.userName,
                      style: AppText.style16Bold(context),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      spacing: 8,
                      children: [
                        StarRating(
                          rating: rating.overallRating,
                          mainAxisAlignment: MainAxisAlignment.start,
                          size: 16,
                          color: AppColor.primary,
                        ),
                        Text(
                          AppDates.formatLocalizedNumberDigits(
                              rating.overallRating, context),
                          style: AppText.style14Bold(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (rating.createdAt != null)
                Text(
                  DateFormat('MMM dd, yyyy').format(rating.createdAt!.toDate()),
                  style: AppText.style12Regular(context).copyWith(
                    color: Colors.grey[600],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[900]
                  : Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildDetailedRating(
                    context,
                    S.of(context).overallRating,
                    rating.overallRating,
                    Icons.star_outline,
                    Colors.amber,
                  ),
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: Colors.grey[300],
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                ),
                Expanded(
                  child: _buildDetailedRating(
                    context,
                    S.of(context).contentRating,
                    rating.contentRating,
                    Icons.book_outlined,
                    Colors.blue,
                  ),
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: Colors.grey[300],
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                ),
                Expanded(
                  child: _buildDetailedRating(
                    context,
                    S.of(context).instructorRating,
                    rating.instructorRating,
                    Icons.person_outlined,
                    Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Comment
          if (rating.comment != null && rating.comment!.isNotEmpty) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.format_quote,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        S.of(context).Review,
                        style: AppText.style12Bold(context).copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    rating.comment!,
                    style: AppText.style14Regular(context),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailedRating(
    BuildContext context,
    String label,
    double rating,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          AppDates.formatLocalizedNumberDigits(rating, context),
          style: AppText.style14Bold(context),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: AppText.style12Regular(context).copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
