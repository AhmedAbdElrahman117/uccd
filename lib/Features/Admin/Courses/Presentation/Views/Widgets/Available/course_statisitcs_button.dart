import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Available/menu_button.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/statistics_view.dart';

class CourseStatisitcsButton extends StatelessWidget {
  const CourseStatisitcsButton({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      icon: FontAwesomeIcons.gauge,
      title: 'Statistics',
      backgroundColor: Colors.green,
      onTap: () async {
        await context.push(
          StatisticsView.id,
          extra: course,
        );
      },
    );
  }
}
