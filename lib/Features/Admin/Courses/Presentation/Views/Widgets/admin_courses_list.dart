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
  });

  final String tagID;
  final List<CourseModel> courses;
  final bool showCounter;
  final bool showControlPanel;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: courses.length,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: AdminCourse(
              course: courses[index],
              tags: TagGenerator.generateMap(tagID, index + 1),
              showControlPanel: showControlPanel,
              showCounter: showCounter,
              imageHeight: MediaQuery.sizeOf(context).height * 0.2,
            ),
          );
        },
      );
}
