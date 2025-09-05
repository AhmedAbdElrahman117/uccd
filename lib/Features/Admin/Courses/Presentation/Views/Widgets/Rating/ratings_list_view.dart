import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Rating/rating_card.dart';

class RatingsListView extends StatelessWidget {
  const RatingsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      sliver: SliverList.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: RatingCard(
              comment: 'comment ${index + 1}',
              rate: 2,
            ),
          );
        },
      ),
    );
  }
}
