import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/average_rating.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/manage_course_button.dart';
import 'package:uccd/generated/l10n.dart';

class AdminArchiveCourse extends StatelessWidget {
  const AdminArchiveCourse({
    super.key,
    required this.tags,
    required this.course,
    required this.imageHeight,
  });

  final Map<String, String> tags;
  final CourseModel course;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? const Color(0xFF2A2A2A) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: () {
        context.push(
          '/CourseDetailsView',
          extra: {
            'data': course,
            'tags': tags,
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDarkMode ? 0.4 : 0.08),
              blurRadius: 20.0,
              offset: const Offset(0, 8),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: isDarkMode ? 0.1 : 0.04),
              blurRadius: 6.0,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
          border: isDarkMode
              ? Border.all(
                  color: Colors.grey.withValues(alpha: 0.15),
                  width: 0.5,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image with improved border radius
            Stack(
              children: [
                CachedImage(
                  imageUrl: course.imageLink,
                  fallbackImage: AppAssets.imagesUCCDLOGO,
                  topRadius: 16,
                  height: imageHeight,
                ),
                AverageRating(
                  average: course.overallRating!,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 20,
                    children: [
                      Expanded(
                        child: Text(
                          course.title,
                          style: AppText.style22Bold(context).copyWith(
                            color: textColor,
                            letterSpacing: 0.2,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ThemeHelper.getWarningAccentColor(context),
                              ThemeHelper.getWarningAccentColor(context)
                                  .withValues(alpha: 0.8),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: ThemeHelper.getWarningAccentColor(context)
                                  .withValues(alpha: 0.4),
                              blurRadius: 8.0,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8,
                          children: [
                            const Icon(
                              Icons.archive_rounded,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            Text(
                              S.of(context).Archived,
                              style: AppText.style14Bold(context).copyWith(
                                color: Colors.white,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: ManageCourseButton(
                      course: course,
                      actionText: 'Manage Course',
                      actionIcon: Icons.settings_outlined,
                      onPressed: () {
                        OverlayController.showArchiveCourseMenu(
                          context,
                          course,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
