import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_button.dart';

class FakeInterviewCard extends StatelessWidget {
  const FakeInterviewCard({super.key, this.isAcceptedList});

  final bool? isAcceptedList;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        children: [
          AdaptiveContainer(
            bottomLeftRadius: 0,
            bottomRightRadius: 0,
            child: ListTile(
              title: const Text('student.name!'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'student.email!',
                  ),
                  Text(
                    'student.department!',
                  ),
                  Text(
                    ' student.year!',
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.circleInfo),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
            ),
          ),
          AdaptiveContainer(
            topLeftRadius: 0,
            topRightRadius: 0,
            allPadding: 8,
            child: Row(
              spacing: 12,
              children: [
                Visibility(
                  visible: isAcceptedList == null || isAcceptedList == true,
                  child: Expanded(
                    child: AdminCourseButton(
                      title: 'Reject',
                      backgroundColor: Colors.redAccent.shade700,
                      icon: Icons.close,
                      onPressed: () {},
                    ),
                  ),
                ),
                Visibility(
                  visible: isAcceptedList == null || isAcceptedList == false,
                  child: Expanded(
                    child: AdminCourseButton(
                      title: 'Accept',
                      backgroundColor: Colors.green,
                      icon: Icons.check,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
