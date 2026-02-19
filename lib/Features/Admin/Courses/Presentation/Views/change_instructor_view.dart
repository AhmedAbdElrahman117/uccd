import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Components/custom_button.dart';
import 'package:uccd/Core/Components/overlay_background.dart';
import 'package:uccd/Core/Components/section_title.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/instructor_menu_field.dart';
import 'package:uccd/generated/l10n.dart';

class ChangeInstructorView extends StatefulWidget {
  const ChangeInstructorView({super.key, required this.course});

  final CourseModel course;

  @override
  State<ChangeInstructorView> createState() => _ChangeInstructorViewState();
}

class _ChangeInstructorViewState extends State<ChangeInstructorView> {
  late TextEditingController instructorController;
  late TextEditingController instructorIDController;

  @override
  void initState() {
    instructorController = TextEditingController(
      text: widget.course.instructor,
    );

    instructorIDController = TextEditingController(
      text: widget.course.instructorID,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCourseCubit.getInstructors(widget.course),
      child: OverlayBackground(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            SectionTitle(title: S.of(context).changeInstructor),
            InstructorMenuField(
              instructorController: instructorController,
              instructorIDController: instructorIDController,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 20,
                right: 20,
              ),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  title: S.of(context).change,
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
