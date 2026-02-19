import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_category.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_enrollment_indicator.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/students_counter.dart';
import 'package:uccd/generated/l10n.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.course,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? const Color(0xFF252525) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFEAEAEA);
    final textColor = isDarkMode ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.black12
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course image or placeholder
            CachedImage(
              imageUrl: course.imageLink,
              fallbackImage: AppAssets.imagesUCCDLOGO,
              height: 120,
              topRadius: 16,
            ),

            // Course info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseCategory(
                    category: course.category,
                  ),

                  // Course title
                  Text(
                    course.title,
                    style: AppText.style16Bold(context).copyWith(
                      color: textColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Instructor
                  Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.person,
                        size: 14,
                        color: textColor.withValues(alpha: 0.7),
                      ),
                      Expanded(
                        child: Text(
                          "${S.of(context).instructor}: ${course.instructor}",
                          style: AppText.style12Regular(context).copyWith(
                            color: textColor.withValues(alpha: 0.7),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  // Dates
                  Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: textColor.withValues(alpha: 0.7),
                      ),
                      Text(
                        "${S.of(context).starts}: ${DateFormat('MMM dd, yyyy').format(course.courseStartDate.toDate())}",
                        style: AppText.style12Regular(context).copyWith(
                          color: textColor.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),

                  CourseEnrollmentIndicator(
                    max: course.maxAcceptedStudents,
                    current: course.currentStudents,
                  ),

                  CourseEnrollmentCounter(
                    maxStudents: course.maxAcceptedStudents,
                    currentStudents: course.currentStudents,
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
