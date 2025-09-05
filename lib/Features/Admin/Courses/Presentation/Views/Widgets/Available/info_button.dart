import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_button.dart';
import 'package:uccd/Features/User/Home/Presentation/Views/course_details_view.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key, required this.tags});

  final Map<String, String> tags;

  @override
  Widget build(BuildContext context) {
    return AdminCourseButton(
      backgroundColor: Colors.blueAccent,
      icon: FontAwesomeIcons.circleInfo,
      title: 'Details',
      onPressed: () async {
        await context.push(CourseDetailsView.id, extra: tags);
      },
    );
  }
}
