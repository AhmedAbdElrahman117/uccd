import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/rating_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Rating/user_rating_card.dart';

class RatingsListView extends StatelessWidget {
  const RatingsListView({
    super.key,
    this.courseId,
    this.filterRating = 'All',
    this.ratings,
  });

  final String? courseId;
  final String filterRating;
  final List<RatingModel>? ratings;

  @override
  Widget build(BuildContext context) {
    // Use provided ratings or generate mock data if none provided
    final List<RatingModel> allRatings = ratings ?? _generateMockRatings();

    // Filter ratings based on selected filter
    final filteredRatings = _filterRatings(allRatings);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      sliver: SliverList.builder(
        itemCount: filteredRatings.length,
        itemBuilder: (context, index) {
          final rating = filteredRatings[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: UserRatingCard(
              rating: rating,
            ),
          );
        },
      ),
    );
  }

  List<RatingModel> _generateMockRatings() {
    return List.generate(
      20,
      (index) => RatingModel(
        rateId: 'rate_$index',
        courseId: courseId ?? 'course_123',
        userId: 'user_$index',
        userName: 'Student ${index + 1}',
        overallRating: (index % 5 + 1).toDouble(),
        contentRating: (index % 5 + 1).toDouble(),
        instructorRating: (index % 5 + 1).toDouble(),
        comment:
            'This is a sample comment for rating ${index + 1}. The course content was engaging and the instructor was knowledgeable.',
        createdAt: null,
      ),
    );
  }

  List<RatingModel> _filterRatings(List<RatingModel> ratings) {
    if (filterRating == 'All') {
      return ratings;
    }

    // Extract the number from filter strings like "5 Stars"
    final ratingValue = int.tryParse(filterRating.split(' ')[0]);
    if (ratingValue == null) return ratings;

    return ratings
        .where((rating) => rating.overallRating.round() == ratingValue)
        .toList();
  }
}
