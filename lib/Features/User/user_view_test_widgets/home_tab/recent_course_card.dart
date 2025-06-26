import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';
import 'package:uccd/generated/l10n.dart';

class RecentCourseCard extends StatelessWidget {
  final CourseModel course;
  final int index;

  const RecentCourseCard({
    super.key,
    required this.course,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFEAEAEA);
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: () => _navigateToCourseDetails(context, course),
      child: Container(
        width: 250,
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
            // Course thumbnail
            CachedImage(
              imageUrl: course.imageLink,
              fallbackImage: AppAssets.imagesUCCDLOGO,
              height: 110,
              topRadius: 16,
            ),

            // Course details
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: ThemeHelper.style14Bold(context).copyWith(
                      color: textColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course.description,
                    style: ThemeHelper.style12Regular(context).copyWith(
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: Text(
                          course.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: ThemeHelper.appPrimaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          S.of(context).enroll,
                          style: ThemeHelper.style12Bold(context).copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCourseDetails(BuildContext context, CourseModel course) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CourseDetailsView(
          course: course,
          tags: const {
            'image': 'course_image',
            'title': 'course_title',
            'counter': 'course_counter',
          },
          hideEnrollButton: false,
        ),
      ),
    );
  }
}
