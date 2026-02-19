import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uccd/Core/Components/adaptive_container.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/Models/student_model.dart';
import 'package:uccd/Core/overlay_controller.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Interview%20Cubit/interview_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/admin_course_button.dart';
import 'package:uccd/generated/l10n.dart';

class InterviewCard extends StatelessWidget {
  const InterviewCard({
    super.key,
    required this.isAcceptedList,
    required this.student,
    required this.course,
  });

  final bool? isAcceptedList;
  final StudentModel student;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return AdaptiveContainer(
      allPadding: 12,
      child: Column(
        spacing: 12,
        children: [
          ListTile(
            title: Text(student.name!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.email!,
                ),
                Text(
                  student.department!,
                ),
                Text(
                  student.year!,
                ),
              ],
            ),
            leading: setLeading(),
            trailing: IconButton(
              onPressed: () {
                OverlayController.showStudentInfoDialog(
                  context,
                  student,
                );
              },
              icon: const Icon(FontAwesomeIcons.circleInfo),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 0,
            ),
          ),
          Row(
            spacing: 12,
            children: [
              Visibility(
                visible: isAcceptedList == null,
                child: Flexible(
                  flex: 1,
                  child: AdminCourseButton(
                    title: S.of(context).reject,
                    backgroundColor: Colors.redAccent.shade700,
                    icon: Icons.close,
                    onPressed: () {
                      BlocProvider.of<InterviewCubit>(context).reject(
                        course: course,
                        student: student,
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: isAcceptedList == null,
                child: Flexible(
                  flex: 1,
                  child: AdminCourseButton(
                    title: S.of(context).accept,
                    backgroundColor: Colors.green,
                    icon: Icons.check,
                    onPressed: () {
                      BlocProvider.of<InterviewCubit>(context).accept(
                        course: course,
                        student: student,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  setLeading() {
    if (isAcceptedList == null) {
      return const Icon(
        FontAwesomeIcons.stopwatch,
      );
    } else if (isAcceptedList == true) {
      return const Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.redAccent.shade700,
      );
    }
  }
}
