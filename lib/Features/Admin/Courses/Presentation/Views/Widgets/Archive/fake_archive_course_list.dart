import 'package:flutter/material.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Archive/fake_archive_course.dart';

class FakeArchiveCourseList extends StatelessWidget {
  const FakeArchiveCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: FakeArchiveCourse(),
        );
      },
    );
  }
}
