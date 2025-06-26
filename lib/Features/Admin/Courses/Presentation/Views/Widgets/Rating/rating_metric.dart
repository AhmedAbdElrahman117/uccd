import 'package:flutter/material.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';

class RatingMetric extends StatelessWidget {
  const RatingMetric({
    super.key,
    required this.label,
    required this.rating,
    required this.icon,
    required this.color,
  });

  final String label;
  final double rating;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          AppDates.formatLocalizedNumberDigits(rating, context),
          style: AppText.style20Bold(context),
        ),
        const SizedBox(height: 4),
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
