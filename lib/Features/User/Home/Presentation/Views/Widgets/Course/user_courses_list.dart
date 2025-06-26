import 'package:flutter/material.dart';
import 'package:uccd/Core/Components/user_course.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/tag_generator.dart';

class UserCoursesList extends StatefulWidget {
  const UserCoursesList({
    super.key,
    required this.data,
    this.showCounter = true,
    this.showInfo = true,
  });

  final List<CourseModel> data;
  final bool showCounter;
  final bool showInfo;

  @override
  State<UserCoursesList> createState() => _UserCoursesListState();
}

class _UserCoursesListState extends State<UserCoursesList> {
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: UserCourse(
            course: widget.data[index],
            tag: TagGenerator.generateMap('UserCourse', index),
            imageHeight: MediaQuery.sizeOf(context).height * 0.2,
          ),
        );
      },
    );
  }
}
