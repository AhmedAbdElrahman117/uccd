import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/User/My%20Courses/Presentation/Views/Widgets/my_course_tile.dart';

class MyCoursesList extends StatelessWidget {
  const MyCoursesList({
    super.key,
    required this.courses,
  });

  final List<Map<CourseModel, bool?>> courses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          child: MyCourseTile(
            course: courses[index].keys.elementAt(index),
            studnetStatus: courses[index].values.elementAt(index),
          ),
        );
      },
    );
  }
}
