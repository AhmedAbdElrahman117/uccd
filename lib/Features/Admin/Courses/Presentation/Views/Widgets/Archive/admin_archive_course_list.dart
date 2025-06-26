import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/tag_generator.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/admin_archive_course.dart';

class AdminArchiveCourseList extends StatelessWidget {
  const AdminArchiveCourseList({
    super.key,
    required this.courses,
  });

  final List<CourseModel> courses;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDarkMode
              ? [
                  const Color(0xFF0F172A),
                  const Color(0xFF1E293B).withValues(alpha: 0.3),
                ]
              : [
                  const Color(0xFFF8FAFC),
                  const Color(0xFFE2E8F0).withValues(alpha: 0.3),
                ],
          stops: const [0.0, 1.0],
        ),
      ),
      child: ListView.builder(
        itemCount: courses.length,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 50)),
          curve: Curves.easeOutBack,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? Colors.black.withValues(alpha: 0.3)
                        : Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: AdminArchiveCourse(
                tags: TagGenerator.generateMap(
                  'ArchiveCourses',
                  index,
                ),
                course: courses[index],
                imageHeight: MediaQuery.sizeOf(context).height * 0.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
