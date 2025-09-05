import 'package:flutter/material.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/Models/rating_model.dart';
import 'package:uccd/generated/l10n.dart';

class RatingsCount extends StatelessWidget {
  const RatingsCount({
    super.key,
    required this.selectedFilter,
    this.ratings,
  });

  final String selectedFilter;
  final List<RatingModel>? ratings;

  @override
  Widget build(BuildContext context) {
    final allRatings = ratings ?? [];
    final filteredCount = _getFilteredCount(context, allRatings);
    final totalCount = allRatings.length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        _getDisplayText(
          context,
          totalCount,
          filteredCount,
        ),
        style: AppText.style14Regular(context).copyWith(
          color: Colors.grey[600],
        ),
      ),
    );
  }

  int _getFilteredCount(BuildContext context, List<RatingModel> ratings) {
    // Check if selectedFilter matches the localized "All" string
    if (selectedFilter == S.of(context).allRatings) {
      return ratings.length;
    }

    // Convert localized filter to backend format to extract rating value
    final backendFilter = _getFilterForBackend(context, selectedFilter);
    final ratingValue = int.tryParse(backendFilter.split(' ')[0]);
    if (ratingValue == null) return ratings.length;

    return ratings
        .where((rating) => rating.overallRating.round() == ratingValue)
        .length;
  }

  String _getDisplayText(
      BuildContext context, int totalCount, int filteredCount) {
    if (selectedFilter == S.of(context).allRatings) {
      return totalCount == 0
          ? S.of(context).noReviewsYet
          : totalCount == 1
              ? S.of(context).showingOneReview
              : S.of(context).showingMultipleReviews(
                  AppDates.formatLocalizedNumber(totalCount, context));
    } else {
      return filteredCount == 0
          ? S.of(context).noFilteredReviews(selectedFilter)
          : filteredCount == 1
              ? S.of(context).showingOneFilteredReview(selectedFilter)
              : S.of(context).showingMultipleFilteredReviews(
                    AppDates.formatLocalizedNumber(filteredCount, context),
                    selectedFilter,
                  );
    }
  }

  // Helper method to convert localized filter to English equivalent for backend filtering
  String _getFilterForBackend(BuildContext context, String localizedFilter) {
    if (localizedFilter == S.of(context).allRatings) return 'All';
    if (localizedFilter == S.of(context).fiveStars) {
      return '5 Stars';
    }
    if (localizedFilter == S.of(context).fourStars) {
      return '4 Stars';
    }
    if (localizedFilter == S.of(context).threeStars) {
      return '3 Stars';
    }
    if (localizedFilter == S.of(context).twoStars) {
      return '2 Stars';
    }
    if (localizedFilter == S.of(context).oneStar) {
      return '1 Stars';
    }
    return 'All'; // Default fallback
  }
}
