import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/tag_generator.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course.dart';

class AdminCoursesList extends StatelessWidget {
  const AdminCoursesList({
    super.key,
    required this.courses,
    required this.tagID,
    this.showCounter = true,
    this.showControlPanel = true,
    this.onRefresh,
  });

  final String tagID;
  final List<CourseModel> courses;
  final bool showCounter;
  final bool showControlPanel;
  final Future<void> Function()? onRefresh;

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
      child: _buildListView(context, isDarkMode),
    );
  }

  Widget _buildListView(BuildContext context, bool isDarkMode) {
    return ListView.builder(
      itemCount: courses.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: isDarkMode
                      ? Colors.black.withValues(alpha: 0.4)
                      : Colors.black.withValues(alpha: 0.08),
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: isDarkMode
                      ? Colors.black.withValues(alpha: 0.2)
                      : Colors.black.withValues(alpha: 0.04),
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: AdminCourse(
              course: courses[index],
              tags: TagGenerator.generateMap(tagID, index + 1),
              showControlPanel: showControlPanel,
              showCounter: showCounter,
              imageHeight: MediaQuery.sizeOf(context).height * 0.2,
            ),
          ),
        );
      },
    );
  }
}
