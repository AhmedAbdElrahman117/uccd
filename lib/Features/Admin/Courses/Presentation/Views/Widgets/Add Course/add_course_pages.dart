import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uccd/Core/Models/course_model.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views%20Model/Add%20Course%20Cubit/add_course_cubit.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/course_basic_info_page.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/course_dates_page.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/course_goals_page.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/course_image_page.dart';
import 'package:uccd/Features/Admin/Courses/Presentation/Views/Widgets/Add%20Course/course_prerequests_page.dart';

class AddCoursePages extends StatelessWidget {
  const AddCoursePages({
    super.key,
    required this.pageController,
    required this.titleController,
    required this.instructorController,
    required this.acceptedStudentsController,
    required this.categoryController,
    required this.classController,
    required this.descriptionController,
    required this.durationController,
    required this.courseStartController,
    required this.courseEndController,
    required this.interviewEndController,
    required this.interviewStartController,
    required this.imagePath,
    required this.datesKey,
    required this.infoKey,
    required this.goalsController,
    required this.goalsKey,
    required this.instructorIDController,
    required this.categoryIDController,
    this.currentCourse,
    required this.prerequestsController,
    required this.prequesetsKey,
  });

  final GlobalKey<FormState> datesKey;
  final GlobalKey<FormState> infoKey;
  final PageController pageController;
  final TextEditingController titleController;
  final TextEditingController instructorController;
  final TextEditingController instructorIDController;
  final TextEditingController acceptedStudentsController;
  final TextEditingController categoryController;
  final TextEditingController categoryIDController;
  final TextEditingController classController;
  final TextEditingController descriptionController;
  final TextEditingController durationController;
  final TextEditingController courseStartController;
  final TextEditingController courseEndController;
  final TextEditingController interviewEndController;
  final TextEditingController interviewStartController;
  final List<TextEditingController> goalsController;
  final TextEditingController imagePath;
  final GlobalKey<FormState> goalsKey;
  final List<TextEditingController> prerequestsController;
  final GlobalKey<FormState> prequesetsKey;

  final CourseModel? currentCourse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: PageView(
        controller: pageController,
        onPageChanged: (value) {
          BlocProvider.of<AddCourseCubit>(context).pageIndexChanged(value);
        },
        children: [
          CourseBasicInfoPage(
            infoKey: infoKey,
            titleController: titleController,
            instructorController: instructorController,
            instructorIDController: instructorIDController,
            acceptedStudentsController: acceptedStudentsController,
            categoryController: categoryController,
            categoryIDController: categoryIDController,
            classController: classController,
            descriptionController: descriptionController,
            durationController: durationController,
            currentCourse: currentCourse,
          ),
          CourseGoalsPage(
            goalsController: goalsController,
            goalsKey: goalsKey,
          ),
          CoursePrerequestsPage(
            prequesetsKey: prequesetsKey,
            prerequestsController: prerequestsController,
          ),
          CourseDatesPage(
            datesKey: datesKey,
            courseStartController: courseStartController,
            courseEndController: courseEndController,
            interviewEndController: interviewEndController,
            interviewStartController: interviewStartController,
          ),
          CourseImagePage(
            imagePath: imagePath,
          ),
        ],
      ),
    );
  }
}
