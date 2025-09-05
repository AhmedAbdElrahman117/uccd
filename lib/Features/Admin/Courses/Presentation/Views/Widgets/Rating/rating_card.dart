import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/app_text.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    super.key,
    required this.rate,
    required this.comment,
  });

  final double rate;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      verticalPadding: 12,
      horizontalPadding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(),
            title: const Text('Student Name'),
            subtitle: StarRating(
              rating: rate,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            contentPadding: EdgeInsets.zero,
          ),
          Text(
            comment,
            style: AppText.style16Regular(context),
          ),
        ],
      ),
    );
  }
}
