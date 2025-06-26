import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';

class CourseSectionTitle extends StatelessWidget {
  const CourseSectionTitle({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,
  });

  final String title;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: iconColor == null
                ? AppColor.primary.withValues(alpha: 0.1)
                : iconColor?.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor ?? AppColor.primary,
            size: 18,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
