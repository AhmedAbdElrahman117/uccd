import 'package:flutter/material.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';

class CourseCategory extends StatelessWidget {
  const CourseCategory({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColor.primary.withValues(
          alpha: 0.2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 6,
        children: [
          const Icon(
            Icons.category,
            size: 16,
            color: AppColor.primary,
          ),
          Text(
            category,
            style: AppText.style14Bold(context).copyWith(
              color: AppColor.primary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
