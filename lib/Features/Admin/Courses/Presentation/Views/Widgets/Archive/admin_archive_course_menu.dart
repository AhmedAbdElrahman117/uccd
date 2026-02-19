import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/generated/l10n.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/Components/enhanced_overlay_background.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/Components/enhanced_archive_statistics_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/Components/enhanced_course_students_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/Components/enhanced_course_ratings_button.dart';

class AdminArchiveCourseMenu extends StatelessWidget {
  const AdminArchiveCourseMenu({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return EnhancedOverlayBackground(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          children: [
            Text(
              S.of(context).archivePanel,
              style: AppText.style20Bold(context),
            ),
            MasonryGridView(
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              shrinkWrap: true,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: EdgeInsets.zero,
              children: [
                EnhancedArchiveStatisticsButton(
                  course: course,
                ),
                EnhancedCourseStudentsButton(
                  course: course,
                ),
                EnhancedCourseRatingsButton(
                  course: course,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
