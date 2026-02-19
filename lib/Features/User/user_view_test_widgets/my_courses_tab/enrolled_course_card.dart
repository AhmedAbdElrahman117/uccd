import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_dates.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Core/theme_helper.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Features/User/Rating/Presentation/Views/rate_course_view.dart';
import 'package:uccd/generated/l10n.dart';

class EnrolledCourseCard extends StatelessWidget {
  final CourseModel course;
  final VoidCallback onTap;
  final String status;
  final double? progress;
  final bool? isRated;

  const EnrolledCourseCard({
    super.key,
    required this.course,
    required this.onTap,
    required this.status,
    this.progress,
    this.isRated,
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
        margin: const EdgeInsets.symmetric(vertical: 8),
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
            Stack(
              children: [
                CachedImage(
                  imageUrl: course.imageLink,
                  fallbackImage: AppAssets.imagesUCCDLOGO,
                  height: 180,
                  topRadius: 16,
                ),

                // Status badge
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      _getLocalizedStatus(context, status),
                      style: ThemeHelper.style12Bold(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Course info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course title
                  Text(
                    course.title,
                    style: ThemeHelper.style16Bold(context).copyWith(
                      color: textColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  // Category chip
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: ThemeHelper.appPrimaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      course.category,
                      style: ThemeHelper.style12Regular(context).copyWith(
                        color: ThemeHelper.appPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Instructor
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 14,
                        color: textColor.withValues(alpha: 0.7),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "${S.of(context).instructor}: ${course.instructor}",
                          style: ThemeHelper.style12Regular(context).copyWith(
                            color: textColor.withValues(alpha: 0.7),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Dates
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: textColor.withValues(alpha: 0.7),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        status == 'Completed'
                            ? "${S.of(context).ended}: ${DateFormat('MMM dd, yyyy').format(course.courseEndDate.toDate())}"
                            : "${S.of(context).ends}: ${DateFormat('MMM dd, yyyy').format(course.courseEndDate.toDate())}",
                        style: ThemeHelper.style12Regular(context).copyWith(
                          color: textColor.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Visibility(
                    visible: progress != null && status == 'In Progress',
                    child: _showProgressBar(
                      context,
                      textColor,
                      isDarkMode,
                    ),
                  ),
                  Visibility(
                    visible: isRated != null &&
                        isRated! == false &&
                        status == 'Completed',
                    child: _showRateButton(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center _showRateButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RateCourseView(
                course: course,
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.star,
          color: Colors.white,
        ),
        label: Text(
          S.of(context).rateCourse,
          style: AppText.style14Regular(context).copyWith(
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
        ),
      ),
    );
  }

  Column _showProgressBar(
      BuildContext context, Color textColor, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).yourProgress,
              style: ThemeHelper.style12Bold(context).copyWith(
                color: textColor,
              ),
            ),
            Text(
              AppDates.formatLocalizedPercent(progress ?? 0, context),
              style: ThemeHelper.style12Bold(context).copyWith(
                color: ThemeHelper.appPrimaryColor,
              ),
            ),
          ],
        ),
        LinearProgressIndicator(
          value: progress,
          backgroundColor:
              isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
          color: ThemeHelper.appPrimaryColor,
          borderRadius: BorderRadius.circular(4),
          minHeight: 8,
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'In Progress':
        return Colors.blue;
      case 'Completed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getLocalizedStatus(BuildContext context, String status) {
    switch (status) {
      case 'In Progress':
        return S.of(context).inProgress;
      case 'Completed':
        return S.of(context).completed;
      case 'Pending':
        return S.of(context).pending;
      case 'Rejected':
        return S.of(context).rejected;
      default:
        return status;
    }
  }
}
