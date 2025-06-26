import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Components/Hero/hero_title.dart';
import 'package:uccd/Core/Components/counter_banner.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_assets.dart';
import 'package:uccd/Core/Components/cached_image.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/manage_course_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_meta_info.dart';
import 'package:uccd/generated/l10n.dart';

class AdminCourse extends StatelessWidget {
  const AdminCourse({
    super.key,
    this.onTap,
    required this.course,
    required this.tags,
    this.showCounter = true,
    this.showControlPanel = true,
    required this.imageHeight,
  });

  final void Function()? onTap;
  final CourseModel course;
  final Map<String, String> tags;
  final bool showCounter;
  final bool showControlPanel;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardBackgroundColor =
        isDarkMode ? const Color(0xFF2A2A2A) : Colors.white;
    final borderColor =
        isDarkMode ? const Color(0xFF3D3D3D) : const Color(0xFFEAEAEA);
    const cardBorderRadius = 12.0;

    return Container(
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(cardBorderRadius),
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.08),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(cardBorderRadius),
          onTap: () {
            context.push(
              CourseDetailsView.id,
              extra: {
                'data': course,
                'tags': tags,
              },
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image with Overlay
              Stack(
                children: [
                  CachedImage(
                    imageUrl: course.imageLink,
                    fallbackImage: AppAssets.imagesUCCDLOGO,
                    height: imageHeight,
                    topRadius: cardBorderRadius,
                  ),
                  // Gradient Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(cardBorderRadius),
                          topRight: Radius.circular(cardBorderRadius),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ), // Course Content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Title and Counter Row
                    Row(
                      children: [
                        Expanded(
                          child: HeroTitle(
                            tag: tags['Title']!,
                            title: course.title,
                          ),
                        ),
                        if (showCounter) ...[
                          const SizedBox(width: 8.0),
                          Hero(
                            tag: tags['Counter']!,
                            child: CounterBanner(
                              current: course.currentStudents ?? 0,
                              max: course.maxAcceptedStudents,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Course Meta Information
                    AdminCourseMetaInfo(
                      course: course,
                      showDuration: true,
                      customStatus: S.of(context).Active,
                    ),

                    const SizedBox(height: 12.0),

                    // Action Button
                    if (showControlPanel)
                      Center(
                        child: ManageCourseButton(
                          course: course,
                          actionText: 'Manage Course',
                          actionIcon: Icons.settings_outlined,
                        ),
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
