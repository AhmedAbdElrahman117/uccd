import 'package:flutter/material.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/Widgets/rate_card_view.dart';

class RatingCardsList extends StatelessWidget {
  const RatingCardsList({
    super.key,
    required this.onRatingOverallChanged,
    required this.onRatingContentChanged,
    required this.onRatingInstructorChanged,
    required this.contentRate,
    required this.instructorRate,
    required this.overallRate,
  });

  final dynamic Function(double) onRatingOverallChanged;
  final dynamic Function(double) onRatingContentChanged;
  final dynamic Function(double) onRatingInstructorChanged;
  final double contentRate;
  final double instructorRate;
  final double overallRate;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        RateCardView(
          icon: Icons.star_rounded,
          title: 'Overall Rating',
          subtitle: 'How would you rate this course overall?',
          rate: overallRate,
          onRatingChanged: onRatingOverallChanged,
        ),
        RateCardView(
          icon: Icons.menu_book_rounded,
          title: 'Course Content',
          subtitle: 'Quality and relevance of the material',
          rate: contentRate,
          onRatingChanged: onRatingContentChanged,
        ),
        RateCardView(
          icon: Icons.person_rounded,
          title: 'Instructor',
          subtitle: 'Teaching quality and engagement',
          rate: instructorRate,
          onRatingChanged: onRatingInstructorChanged,
        ),
      ],
    );
  }
}
