import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/generated/l10n.dart';

class InstructorCourseCard extends StatelessWidget {
  final CourseModel course;
  final VoidCallback? onTap;

  const InstructorCourseCard({
    super.key,
    required this.course,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Card(
        elevation: 12,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image
              CachedImage(
                imageUrl: course.imageLink,
                height: 180,
                topRadius: 12,
                fallbackImage: AppAssets.imagesUCCDLOGO,
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Title
                    Text(
                      course.title,
                      style: AppText.style24Bold(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Course Description
                    Text(
                      course.description,
                      style: AppText.style14Regular(context).copyWith(
                        height: 1.4,
                        color: ThemeHelper.isDark(context)
                            ? Colors.grey.shade300
                            : Colors.grey.shade700,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),

                    // Course Info Row
                    Row(
                      children: [
                        // Category Chip
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            spacing: 8,
                            children: [
                              Icon(
                                Icons.category,
                                color: Colors.white,
                                size: 20,
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
                        const Spacer(), // Students Count
                        Row(
                          children: [
                            Icon(
                              Icons.people_outline,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${AppDates.formatLocalizedNumberDigits(course.currentStudents ?? 0, context)}/${AppDates.formatLocalizedNumberDigits(course.maxAcceptedStudents, context)}',
                              style: AppText.style12Regular(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Duration and Room Info
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${AppDates.formatLocalizedNumberDigits(course.duration, context)} ${S.of(context).Hour}',
                          style: AppText.style12Regular(context),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.room,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${S.of(context).room} ${AppDates.formatLocalizedNumberDigits(course.roomNumber, context)}',
                          style: AppText.style12Regular(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
