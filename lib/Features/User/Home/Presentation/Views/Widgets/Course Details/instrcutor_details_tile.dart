import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_color.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/Widgets/Course%20Details/course_section_background.dart';
import 'package:uccd/generated/l10n.dart';

class InstrcutorDetailsTile extends StatelessWidget {
  const InstrcutorDetailsTile({
    super.key,
    required this.isDarkMode,
    required this.course,
  });

  final bool isDarkMode;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return CourseSectionBackground(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: AppColor.primary.withValues(alpha: 0.2),
          child: Text(
            course.instructor[0].toUpperCase(),
            style: AppText.style18Bold(context).copyWith(
              color: AppColor.primary,
            ),
          ),
        ),
        title: Text(
          S.of(context).instructorTitle,
          style: AppText.style16Bold(context),
        ),
        subtitle: Text(
          course.instructor,
          style: AppText.style14Regular(context),
        ),
      ),
    );
  }
}
