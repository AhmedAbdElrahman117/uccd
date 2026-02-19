import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/app_text.dart';

class AverageRating extends StatelessWidget {
  const AverageRating({
    super.key,
    required this.average,
  });

  final double average;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: AdaptiveContainer(
        allPadding: 8,
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text(
              '$average',
              style: AppText.style14Bold(context),
            ),
          ],
        ),
      ),
    );
  }
}
