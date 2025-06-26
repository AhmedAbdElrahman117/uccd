import 'package:flutter/material.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';

class AverageRating extends StatelessWidget {
  const AverageRating({
    super.key,
    required this.average,
  });

  final double average;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode
        ? const Color(0xFF333333).withValues(alpha: 0.9)
        : Colors.white.withValues(alpha: 0.9);
    final borderColor =
        isDarkMode ? const Color(0xFF444444) : const Color(0xFFEAEAEA);

    return Positioned(
      top: 12.0,
      left: 12.0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              AppDates.formatLocalizedNumberDigits(average, context),
              style: AppText.style14Bold(context),
            ),
          ],
        ),
      ),
    );
  }
}
