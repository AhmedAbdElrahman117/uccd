import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';

class InstructorViewHeader extends StatelessWidget {
  const InstructorViewHeader({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedImage(
            imageUrl: course.imageLink,
            bottomRadius: 24,
            topRadius: 24,
            fallbackImage: AppAssets.imagesUCCDLOGO,
          ),
          const SizedBox(height: 24),
          Text(
            course.title,
            style: AppText.style24Bold(context),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.category,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      course.category,
                      style: AppText.style12Bold(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.room,
                      size: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${S.of(context).room} ${course.roomNumber}',
                      style: AppText.style12Bold(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
