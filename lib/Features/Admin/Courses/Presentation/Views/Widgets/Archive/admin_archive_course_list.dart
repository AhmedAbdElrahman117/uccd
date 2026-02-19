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
    return ListView.builder(
      itemCount: courses.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 12,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: AdminArchiveCourse(
          tags: TagGenerator.generateMap(
            'ArchiveCourses',
            index,
          ),
          course: courses[index],
          imageHeight: MediaQuery.sizeOf(context).height * 0.2,
        ),
      ),
    );
  }
}
