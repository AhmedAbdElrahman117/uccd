import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/fake_available_course.dart';

class FakeAvailableCourseList extends StatelessWidget {
  const FakeAvailableCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: FakeAvailableCourse(),
        );
      },
    );
  }
}
