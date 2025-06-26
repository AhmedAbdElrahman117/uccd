import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';

class CourseProgressCard extends StatelessWidget {
  final String title;
  final String instructor;
  final double progress;
  final String progressText;
  final VoidCallback onTap;
  final CourseModel? course; // Add optional course parameter

  const CourseProgressCard({
    super.key,
    required this.title,
    required this.instructor,
    required this.progress,
    required this.progressText,
    required this.onTap,
    this.course,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFEAEAEA);
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final secondaryTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Colors.black12 : Colors.black.withAlpha(13),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: ThemeHelper.appPrimaryColor.withAlpha(26),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CachedImage(
                    imageUrl: course?.imageLink,
                    fallbackImage: AppAssets.imagesUCCDLOGO,
                    bottomRadius: 12,
                    topRadius: 12,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: ThemeHelper.style16Bold(context).copyWith(
                          color: textColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        instructor,
                        style: ThemeHelper.style14Regular(context).copyWith(
                          color: secondaryTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: isDarkMode
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      color: ThemeHelper.appPrimaryColor,
                      minHeight: 8,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  AppDates.formatLocalizedPercent(progress, context),
                  style: ThemeHelper.style14Bold(context).copyWith(
                    color: ThemeHelper.appPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CourseDetailsNavigator {
  static void navigateToCourseDetails(
      BuildContext context, CourseModel course) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CourseDetailsView(
          course: course,
          tags: const {
            'image': 'course_image',
            'title': 'course_title',
            'counter': 'course_counter',
          },
          hideEnrollButton: true,
        ),
      ),
    );
  }
}
