import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';
import 'package:uccd/Features/User/user_view_test_widgets/courses_tab/course_card.dart';

class CourseGrid extends StatelessWidget {
  final List<CourseModel> courses;
  final bool isDarkMode;

  const CourseGrid({
    super.key,
    required this.courses,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 8,
          ),
          child: CourseCard(
            course: courses[index],
            onTap: () => _navigateToCourseDetails(context, courses[index]),
          ),
        );
      },
    );
  }

  void _navigateToCourseDetails(BuildContext context, CourseModel course) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailsView(
          course: course,
          tags: {
            'category': course.category,
            'instructor': course.instructor,
          },
        ),
      ),
    );
  }
}
