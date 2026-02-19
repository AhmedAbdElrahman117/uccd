import 'package:flutter/material.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Core/app_text.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/category_menu_field.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/class_number_field.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/course_description_field.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/course_title_field.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/duration_field.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/instructor_menu_field.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/max_accepted_students_field.dart';
import 'package:uccd/generated/l10n.dart';

class CourseBasicInfoPage extends StatefulWidget {
  const CourseBasicInfoPage({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.instructorController,
    required this.categoryController,
    required this.classController,
    required this.durationController,
    required this.acceptedStudentsController,
    required this.infoKey,
    required this.instructorIDController,
    required this.categoryIDController,
    this.currentCourse,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController instructorController;
  final TextEditingController instructorIDController;
  final TextEditingController categoryController;
  final TextEditingController categoryIDController;
  final TextEditingController classController;
  final TextEditingController durationController;
  final TextEditingController acceptedStudentsController;
  final GlobalKey<FormState> infoKey;
  final CourseModel? currentCourse;

  @override
  State<CourseBasicInfoPage> createState() => _CourseBasicInfoPageState();
}

class _CourseBasicInfoPageState extends State<CourseBasicInfoPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: widget.infoKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).courseInfo,
                  style: AppText.style18Bold(context),
                ),
                Text(
                  S.of(context).courseInfoDescription,
                  style: AppText.style16Regular(context),
                ),
                CourseTitleField(
                  titleController: widget.titleController,
                ),
                CourseDescriptionField(
                  descriptionController: widget.descriptionController,
                ),
                InstructorMenuField(
                  instructorController: widget.instructorController,
                  instructorIDController: widget.instructorIDController,
                  enabled: widget.currentCourse == null,
                ),
                CategoryMenuField(
                  categoryController: widget.categoryController,
                  categoryIDController: widget.categoryIDController,
                  enabled: widget.currentCourse == null,
                ),
                Row(
                  spacing: 20,
                  children: [
                    ClassNumberField(
                      classController: widget.classController,
                    ),
                    DurationField(
                      durationController: widget.durationController,
                    ),
                  ],
                ),
                MaxAcceptedStudentsField(
                  acceptedStudentsController: widget.acceptedStudentsController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
